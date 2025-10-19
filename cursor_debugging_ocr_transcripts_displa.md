# Debugging OCR transcripts display issue
_Exported on 10/18/2025 at 23:43:56 CDT from Cursor (1.7.52)_

---

**User**

Maybe you can help. I've been working in claude code on this CollectionBuilder-GH repo. I'm working with historic newspapers and I'm trying to set up a way to display the OCR transcriptps. Claude keeps trying to build this implementation but the button still won't appear under the metadata as indicated it would. Can you take a look and see what might be the issue?

---

**Cursor**

Let me scan the project for how transcripts are supposed to be wired into the item page and where the button is injected, then open the key files in parallel to verify includes, conditions, and required metadata fields.

I'll open the full `item-js.html` to verify script load order and whether `displayTranscriptForItem` is available when called, and also check if `VDT_metadata.csv` has the `object_transcript` field populated for your items.

I found the issue: the transcript script is loaded after the item script, so when `item-js.html` tries to call `displayTranscriptForItem(...)`, the function isn’t defined yet and nothing happens. Also, your transcript paths start with a leading slash, which can 404 on GitHub Pages with a baseurl, preventing the button from rendering since the code only inserts the UI if fetch succeeds.

### Where it breaks
```1:6:_layouts/item.html
---
# JS based item page for CB-GH
layout: default
custom-foot: js/item-js.html;js/modal-hash-js.html;js/transcript-display.html
gallery: true
---
```

```398:406:_includes/js/item-js.html
/* add transcript display if available */
if (typeof displayTranscriptForItem === 'function') {
    displayTranscriptForItem(record, 'item-metadata');
}

/* add transcripts for compound object children */
if (typeof initTranscriptsForCompoundItems === 'function' && compoundItem && compoundItem.length > 0) {
    initTranscriptsForCompoundItems(compoundItem);
}
```

### Fix 1 — Load transcript script first
Change `custom-foot` order so transcript functions exist before they’re called.

Replace this line in `/_layouts/item.html`:
```4:4:_layouts/item.html
custom-foot: js/item-js.html;js/modal-hash-js.html;js/transcript-display.html
```

With:
```4:4:_layouts/item.html
custom-foot: js/transcript-display.html;js/item-js.html;js/modal-hash-js.html
```

### Fix 2 — Make transcript fetch baseurl-aware (optional but recommended)
Your `VDT_metadata.csv` uses paths like `/OCR/…`. On GitHub Pages with a `baseurl`, that points to the domain root and 404s. Either remove the leading slash in CSV (e.g., `OCR/camh-...txt`) or make the JS handle baseurl.

Edit `/_includes/js/transcript-display.html`:

Add a baseurl variable at the top:
```23:23:_includes/js/transcript-display.html
var CB_BASEURL = "{{ site.baseurl | default: '' }}";
```

Modify `loadTranscript` to prefix baseurl when needed:
```7:21:_includes/js/transcript-display.html
async function loadTranscript(transcriptPath) {
    try {
        const url = transcriptPath.startsWith('/') ? (CB_BASEURL + transcriptPath) : transcriptPath;
        const response = await fetch(url);
        if (!response.ok) {
            console.log(`Transcript not found: ${url}`);
            return null;
        }
        const text = await response.text();
        return text;
    } catch (error) {
        console.error(`Error loading transcript: ${error}`);
        return null;
    }
}
```

Alternatively, bulk edit `/_data/VDT_metadata.csv` to remove the leading slash from `object_transcript` values (e.g., replace `/OCR/` with `OCR/`).

### Important behavior note
- The top-level compound object records don’t have `object_transcript`, so the button won’t show on the parent’s metadata. It will show inside each child item’s modal after you click a card, because those child records do have `object_transcript`, and the code inserts the button into each child modal’s metadata section.
- If you want a transcript button on the parent page too (e.g., first page or concatenated transcript), we can add that logic.

### Quick check
- Open a compound object item page, click a child card to open its modal, and you should see “Show OCR Text” under the child’s metadata.
- For single non-compound items with `object_transcript`, the button will appear directly under the page metadata.

- Reordered `custom-foot` in `/_layouts/item.html` so transcript functions are defined before `item-js.html` calls them.
- Suggested making transcript fetching baseurl-aware (or removing leading slashes in `object_transcript` paths) to avoid 404s and ensure the button renders.

```html
---
# JS based item page for CB-GH
layout: default
custom-foot: js/item-js.html;js/modal-hash-js.html;js/transcript-display.html
gallery: true
---
```

```html
/* add transcript display if available */
if (typeof displayTranscriptForItem === 'function') {
    displayTranscriptForItem(record, 'item-metadata');
}

/* add transcripts for compound object children */
if (typeof initTranscriptsForCompoundItems === 'function' && compoundItem && compoundItem.length > 0) {
    initTranscriptsForCompoundItems(compoundItem);
}
```

```html
custom-foot: js/item-js.html;js/modal-hash-js.html;js/transcript-display.html
```

```html
custom-foot: js/transcript-display.html;js/item-js.html;js/modal-hash-js.html
```

```html
var CB_BASEURL = "{{ site.baseurl | default: '' }}";
```

```html
async function loadTranscript(transcriptPath) {
    try {
        const url = transcriptPath.startsWith('/') ? (CB_BASEURL + transcriptPath) : transcriptPath;
        const response = await fetch(url);
        if (!response.ok) {
            console.log(`Transcript not found: ${url}`);
            return null;
        }
        const text = await response.text();
        return text;
    } catch (error) {
        console.error(`Error loading transcript: ${error}`);
        return null;
    }
}
```


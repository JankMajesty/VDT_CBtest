# Task Completion Checklist

When completing a development task in CollectionBuilder-GH, follow these steps:

## 1. Code Quality Checks

### Documentation
- [ ] Add inline comments explaining complex code
- [ ] Update relevant documentation files if needed
- [ ] Ensure educational value is maintained

### Style Compliance
- [ ] Verify proper indentation (4 spaces for HTML/JS/CSS, 2 spaces for YAML)
- [ ] Check Liquid template spacing for readability
- [ ] Remove excess white space
- [ ] Ensure descriptive naming conventions

### Backwards Compatibility
- [ ] Test that existing data setups still work
- [ ] Verify demo metadata still functions
- [ ] Check that missing config variables have sane defaults

## 2. Testing

### Local Testing
- [ ] Run `bundle exec jekyll serve` to test locally
- [ ] Verify changes work as expected at http://localhost:4000
- [ ] Test with demo metadata (`demo-metadata.csv`)
- [ ] Check console for JavaScript errors
- [ ] Test responsive design (mobile, tablet, desktop)

### Feature Testing
- [ ] Test new features with various metadata configurations
- [ ] Verify multi-valued fields (using `;` separator) work correctly
- [ ] Check map functionality if location data is involved
- [ ] Test timeline if date fields are affected
- [ ] Verify search functionality if metadata fields changed

### Browser Testing
- [ ] Test in multiple browsers (Chrome, Firefox, Safari)
- [ ] Check for accessibility issues

## 3. Build Verification

### Development Build
```bash
bundle exec jekyll build
```
- [ ] Build completes without errors
- [ ] Check `_site/` directory for expected output

### Production Build
```bash
JEKYLL_ENV=production bundle exec jekyll build
```
- [ ] Production build succeeds
- [ ] No warnings or errors in build output

## 4. Git and Version Control

### Before Committing
- [ ] Review all changes with `git diff`
- [ ] Stage only relevant files with `git add`
- [ ] Verify `.gitignore` is respected (_site/, .jekyll-cache/, etc.)

### Commit
- [ ] Write meaningful commit message
- [ ] Reference any related issues or PRs

## 5. Documentation Updates

### If Applicable
- [ ] Update README.md if setup process changed
- [ ] Update CONTRIBUTING.md if development process changed
- [ ] Add notes to docs/ folder for technical documentation
- [ ] Update _config.yml comments if configuration changed

## 6. GitHub Pages Deployment

### After Pushing to GitHub
- [ ] Check GitHub Actions for build status
- [ ] Verify site deploys successfully
- [ ] Test live site functionality
- [ ] Check for broken links

## 7. Community

### If Creating a Pull Request
- [ ] Provide detailed PR description
- [ ] Explain what problem is solved or feature added
- [ ] Reference related issues
- [ ] Include screenshots if UI changes
- [ ] Test that changes work on a fresh fork

## Notes on Testing

### No Automated Tests
This project does not currently have automated linting, formatting, or testing scripts. All verification is manual:
- Visual testing in browser
- Manual code review
- Local build verification
- GitHub Pages deployment testing

### Focus Areas
- Ensure educational value is maintained
- Keep code simple and comprehensible
- Maintain backwards compatibility
- Test with real-world collection data if possible

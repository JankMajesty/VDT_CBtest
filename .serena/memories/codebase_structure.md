# Codebase Structure

## Root Directory Files

### Configuration
- `_config.yml` - Main Jekyll configuration file
  - Site settings (title, tagline, description, author)
  - Collection settings (metadata CSV filename)
  - URL and baseurl configuration
  - Build settings and exclusions
  - Organization branding options

### Ruby/Bundler
- `Gemfile` - Ruby gem dependencies (primarily github-pages gem)
- `Gemfile.lock` - Locked gem versions (git-ignored)

### Documentation
- `README.md` - Project overview and quick start guide
- `CONTRIBUTING.md` - Contribution guidelines and conventions
- `CODE_OF_CONDUCT.md` - Community code of conduct
- `SECURITY.md` - Security policies
- `LICENSE` - MIT license for code
- `CITATION.cff` - Citation information

### Site Pages
- `index.md` - Homepage (uses home-infographic layout)
- `404.html` - Error page
- `sitemap.xml` - SEO sitemap

## Directory Structure

### `_data/` - Data Files (CSV)
Configuration and metadata files:
- `demo-metadata.csv` - Example collection metadata
- `demo-compoundobjects-metadata.csv` - Demo compound objects
- `demo-compoundobjects-allmedia.csv` - Demo all media types
- `metadata-template.csv` - Empty template for new collections
- `config-browse.csv` - Browse page configuration
- `config-map.csv` - Map page configuration
- `config-metadata.csv` - Metadata display configuration
- `config-nav.csv` - Navigation menu configuration
- `config-search.csv` - Search configuration
- `config-table.csv` - Data table configuration
- `config-theme-colors.csv` - Theme color customization
- `theme.yml` - Additional theme settings

### `_includes/` - Reusable Components
HTML partials organized by function:
- `head/` - HTML head components (meta tags, analytics)
- `js/` - JavaScript includes (map, timeline, browse, table, search)
- `index/` - Homepage components (carousel, objects, featured terms)
- `feature/` - Feature includes (image, video, audio, pdf, cards, modals)
- `image/` - Image display components
- Root includes: navigation, banners, footers, modals

### `_layouts/` - Page Templates
Jekyll layout files:
- `default.html` - Base layout
- `page.html`, `page-narrow.html`, `page-full-width.html` - Content page layouts
- `home-infographic.html` - Homepage layout
- `browse.html` - Browse/grid view layout
- `item.html` - Individual item display
- `map.html` - Map view layout
- `timeline.html`, `timelinejs.html` - Timeline layouts
- `data.html` - Data download page
- `cloud.html` - Tag/subject cloud layout
- `search.html` - Search page layout
- `about.html` - About page layout

### `pages/` - Content Pages
Markdown files for main site pages:
- `about.md` - About page
- `browse.md` - Browse collection
- `data.md` - Download data
- `item.md` - Item page template
- `locations.md` - Location browse
- `map.md` - Map view
- `search.md` - Search page
- `subjects.md` - Subject browse
- `timeline.md` - Timeline view

### `_sass/` - Stylesheets (SCSS)
Sass/SCSS files for styling:
- `_base.scss` - Base styles
- `_custom.scss` - Custom styles (user modifications)
- `_pages.scss` - Page-specific styles
- `_theme-colors.scss` - Theme color definitions
- `_theme-utilities.scss` - Utility classes

### `assets/` - Static Assets
Static files and external libraries:
- `js/` - Custom JavaScript (e.g., lunr-store.js for search)
- `lib/` - External JavaScript libraries:
  - Bootstrap bundle
  - DataTables
  - Leaflet (maps with clustering, search, fullscreen)
  - Spotlight (image gallery)
  - Lunr.js (search)
  - lazysizes (lazy loading)

### `objects/` - Digital Collection Objects
Directory for collection media files:
- Images (JPEG, PNG)
- PDFs
- Audio files (MP3)
- Video links (YouTube, Vimeo)

### `docs/` - Documentation
Project documentation:
- `cb-docs.md` - Links to full documentation
- `metadata-info.csv` - Metadata field information
- `metadata-template.csv` - Metadata template

### `.serena/` - Serena MCP Configuration
Configuration for Serena MCP server

### Build Output (git-ignored)
- `_site/` - Generated static site
- `.jekyll-cache/` - Jekyll cache
- `.sass-cache/` - Sass cache
- `.bundle/`, `vendor/` - Bundler files

## Key File Patterns

### Liquid Templates
- Use `.html` extension in `_includes/` and `_layouts/`
- Front matter with YAML at top of files
- Liquid tags: `{% %}` for logic, `{{ }}` for output

### Markdown Content
- `.md` files in `pages/` and root
- Front matter specifies layout and other metadata
- Can include Liquid tags and HTML

### Data-Driven Design
- CSV files in `_data/` accessible via `site.data`
- Metadata drives page generation
- Configuration files control feature behavior

# Tech Stack

## Core Technology
- **Jekyll**: Static site generator (Ruby-based)
- **GitHub Pages**: Hosting platform
- **Ruby**: Programming language for Jekyll
- **Bundler**: Ruby dependency management

## Frontend Stack
- **Bootstrap**: CSS framework for basic theme
- **HTML/CSS/JavaScript**: Core web technologies
- **Sass/SCSS**: CSS preprocessor

## JavaScript Libraries (in assets/lib/)
- **DataTables**: Table visualizations
- **Leaflet.js**: Interactive maps
- **Spotlight gallery**: Image galleries
- **lazysizes**: Lazy loading images
- **Lunr.js**: Client-side search
- **Bootstrap bundle**: Bootstrap JavaScript components

## Data Format
- **CSV**: Primary format for collection metadata and configuration
- **YAML**: Jekyll configuration and front matter
- **Markdown**: Content pages

## Standards
- **Schema.org**: Object metadata exposure
- **Open Graph protocol**: Metadata standards

## Directory Structure
- `_data/`: CSV files for metadata and configuration
- `_includes/`: Reusable HTML partials (layouts, components, JavaScript)
- `_layouts/`: Page templates (map, browse, timeline, item, etc.)
- `_sass/`: SCSS stylesheets
- `assets/`: Static files (JavaScript, images, external libraries)
- `pages/`: Main content pages (about, browse, search, etc.)
- `objects/`: Digital collection objects (images, PDFs, audio)
- `docs/`: Documentation files
- `_site/`: Generated site (git-ignored)
- `.jekyll-cache/`, `.sass-cache/`: Build cache (git-ignored)

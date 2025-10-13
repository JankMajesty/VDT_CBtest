# Suggested Commands for CollectionBuilder-GH Development

## Setup and Installation

### Install Dependencies
```bash
bundle install
```
Installs Ruby gems specified in Gemfile, including the github-pages gem.

## Development Commands

### Local Development Server
```bash
bundle exec jekyll serve
```
Starts a local development server, typically at http://localhost:4000. 
Auto-regenerates site when files change.

### Build Site
```bash
bundle exec jekyll build
```
Builds the site to `_site/` directory.

### Production Build
```bash
JEKYLL_ENV=production bundle exec jekyll build
```
Builds with production settings (includes analytics, optimizations).
Note: GitHub Pages automatically does this on deployment.

## System Commands (macOS/Darwin)

### File Operations
- `ls` - List directory contents
- `cd` - Change directory
- `cp` - Copy files
- `mv` - Move/rename files
- `mkdir` - Create directory
- `rm` - Remove files

### Search
- `find` - Find files
- `grep` - Search file contents

### Git Commands
- `git status` - Check repository status
- `git add` - Stage changes
- `git commit` - Commit changes
- `git push` - Push to remote
- `git pull` - Pull from remote
- `git branch` - Manage branches
- `git checkout` - Switch branches

## GitHub Pages Deployment

### Enable GitHub Pages
1. Push changes to GitHub repository
2. Go to repository Settings > Pages
3. Select source branch (usually `main`)
4. GitHub automatically builds and deploys using Jekyll

### Check Deployment
- Site URL follows pattern: `https://username.github.io/repository-name`
- Check Actions tab for build status

## Bundler Commands

### Update Dependencies
```bash
bundle update
```
Updates gems to latest compatible versions.

### Check Gem Versions
```bash
bundle list
```
Lists installed gems and versions.

## Troubleshooting

### Clear Jekyll Cache
```bash
rm -rf _site .jekyll-cache .sass-cache
```
Removes generated files and caches.

### Reinstall Dependencies
```bash
rm -rf vendor/ .bundle/
bundle install
```
Clean reinstall of Ruby dependencies.

## File Editing
- Use any text editor or IDE
- Markdown files for content pages
- CSV files for metadata and configuration
- SCSS files for styling
- HTML files for layouts and includes

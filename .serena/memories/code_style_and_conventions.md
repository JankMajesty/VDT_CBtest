# Code Style and Conventions

## General Principles
- **Educational Focus**: Include lots of inline comments documenting code
- **Simplicity**: Keep code structure relatively simple and comprehensible for digital librarians
- **Readability Over Optimization**: Code should be understandable, not necessarily fully optimized
- **Progressive Enhancement**: New features should maintain backwards compatibility with existing data

## Formatting Standards

### Indentation
- **HTML, JS, CSS**: Indent using 4 spaces
- **YAML**: Indent using 2 spaces
- **Never use tabs**: Always use spaces

### White Space
- Include spaces for readability in Liquid templates
  - Good: `{% if site.example %}{{ site.example }}{% endif %}`
  - Bad: `{%if site.example%}{{site.example}}{%endif%}`
- Avoid excess white space and random indentations

### Liquid Templates
- Use spaces around Liquid tags and variables for readability
- Include comments to explain complex logic

### Metadata Conventions
- Use `;` (semicolon) to denote multi-valued fields in CSV metadata

## Naming Conventions
- Follow existing patterns in the codebase
- Use descriptive, clear names
- Maintain consistency with Jekyll/Ruby conventions

## Configuration
- **Sane Defaults**: Set sensible defaults in Liquid and JavaScript
- Projects lacking updated config variables should still function
- Prefer convention over explicit configuration

## Git Workflow
- **Main branch**: Should always contain code that is ready to go
- **Feature branches**: Use for development
- **Commit messages**: Provide meaningful commit messages
- **Pull Requests**: Include detailed descriptions explaining contributions

## Backwards Compatibility
- New features should add functionality while maintaining compatibility
- Avoid breaking changes to existing data setups
- Test with existing demo metadata to ensure compatibility

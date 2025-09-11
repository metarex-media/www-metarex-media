# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

This is a Hugo-based static website for metarex.media. The project uses clog for build management.

```bash
hugo mod get                        # update all dependencies
hugo mod get github.com/mrmxf/fohuw # update theme
hugo server                         # basic interactive development
clog watch                          # Watch mode with all drafts/future content
clog build                          # production build, docker & tag
docker run \
     --detach \
     --publish 12345:8080 \
     metarexmedia/www-metarex-media # Run build image in docker on port 12345
```

## Architecture Overview

### Website Structure

This is a multi-component website ecosystem:

- **Main site** (`/`): Hugo static site (this repo)
- **Demo apps** (`/app/demos`): Svelte web app for interactive demos
- **Registry UI** (`/app/reg`): Svelte web app for browsing register
- **Download store** (`/dl`): External bulky storage
- **Media assets** (`/r`): External media storage  
- **Registry API** (`/reg`): Backend register service
- **Demo service** (`/svc/demos`): Backend demo service

### Key Directories

- `content/` - Hugo markdown content files
- `layouts/` - Hugo template files
- `assets/` - SCSS, data files (releases.yaml, backers.yaml, etc.)
- `static/` - Static assets (images, downloads, demos)
- `config/` - Hugo configuration files
- `clogrc/` - Build automation scripts via clog tool
- `kodata/` - Generated static site output

### Technology Stack

- **Hugo**: Static site generator with fohuw theme
- **clog**: Cross-platform script management and build automation
- **Go**: Backend server (podserver.go) for container serving
- **ko.build**: Container image building
- **Docker**: Containerization

### Data Files

Configuration is driven by YAML data files in `assets/data/`:

- `releases.yaml` - Version and release information
- `backers.yaml` - Sponsor/backer information  
- `downloads.yaml` - Download links and metadata
- `supporters.yaml` - Supporter information

### Content Organization

- Blog posts in `content/blog/`
- Documentation in `content/docs/`
- Project pages in `content/project/`
- Rexy (mascot) content in `content/rexy-area/`

## Required Tools

- Hugo (version specified in config/_default/module.yaml)
- Go (version in go.mod)
- clog build tool
- Docker
- ko.build for container building

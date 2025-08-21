# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll-based academic website for the Copland project - a research initiative focused on semantics, languages and tools for layered attestation. The project is hosted on GitHub Pages and includes documentation, publications, tutorials, and software resources related to formal verification of remote attestation protocols.

## Build and Development

### Jekyll Site Generation
- This is a Jekyll static site hosted on GitHub Pages
- The site is automatically built and deployed when pushing to the `gh-pages` branch
- Local development can be done with Jekyll but no specific build commands are documented
- The `_site/` directory contains the generated static site

### Content Structure
- **Posts**: Blog posts are in `_posts/` with YAML frontmatter and Jekyll date-based naming
- **Layouts**: HTML templates in `_layouts/` (frontpage.html, blog.html, bare.html)
- **Data**: YAML data files in `_data/` for people, publications, and releases
- **Resources**: Academic papers, Coq proofs, tutorials, and software in `resources/`

## Architecture

### Site Configuration
- Base URL: https://ku-sldg.github.io/copland/
- Uses Kramdown markdown processor
- Main navigation: Home, Publications, Documentation, Software, Blog

### Content Types
1. **Academic Resources**: 
   - Coq formal verification code in `resources/coplandcoq/` and `resources/apdtcoq/`
   - PDF papers and publications
   - Copland protocol examples (`.cop` files) and tutorials

2. **Documentation**:
   - Copland Tutorial at `resources/tutorial/`
   - CHASE Tutorial at `resources/chase-tutorial/`
   - Coq documentation as generated HTML

3. **Blog System**: 
   - Jekyll posts with categories and date-based URLs
   - Recent activities displayed on frontpage

### Key Components
- **People Management**: Faculty, students, and staff defined in `_data/people.yml`
- **Publications**: Academic papers tracked in `_data/publications.yml`
- **Dynamic Content**: Uses Jekyll includes for people lists, publications, and blog previews

## Working with Coq Code

The repository contains formal verification materials:
- Coq source files use `.v` extensions
- Build with `make` in Coq directories
- Generate documentation with `./mkdoc` scripts where available
- HTML documentation generated to `html/` subdirectories

## Content Guidelines

- Maintain academic tone consistent with research project
- All blog posts require proper YAML frontmatter with layout, title, and categories
- Publications should include author, title, venue, and PDF/URL links
- Resources should be well-documented with README files where appropriate
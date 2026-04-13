# Template Quarto report

Template for a Quarto report for the University of Lleida that runs on Docker.

## Requirements

Make sure to have **Docker** and **Make** installed.

## Commands

- `make preview`: Shows a preview of the report on your browser.
- `make render`: Renders the report to a PDF file on the `output/` folder.
- `make clean`: Cleans up the project.

If you do not wish to use the commands in the Makefile, you can run these commands:

```bash
# Preview
docker compose -f docker-compose.preview.yml up --build

# Render
docker compose -f docker-compose.render.yml up --build
```

## Structure

The structure of the report is detailed in the following files:

- `report.qmd`: The source of the report, written on Quarto Markdown.
- `_quarto.yml`: The metadata and configuration of the project.
- `reference.bibtex`: The list of reference, following the [bibtex format](https://www.bibtex.org/Format/)

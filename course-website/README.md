# Retained Gatsby course-site starter

This subdirectory preserves the Gatsby 2 starter used by the original course.
The repository root contains the adapted lessons, the practice launcher, and a
separate Gatsby 4 project. Start with the [Vim learning guide](../README.md#start-here)
for local practice. The launcher needs Python and Neovim.

## Lesson sources

The root `lessons/` and this subdirectory's `lessons/` mirror each other. Make
lesson text changes in both trees and run the check from the repository root:

```sh
python3 .learning/check.py
```

The site uses Markdown front matter. Set `path` to the route beginning with
`/`, `title` to the displayed title, and `order` to the lesson's position.
`section` supplies an optional section label and `description` supplies an
optional page summary.

## Site scripts and deployment

The two Gatsby projects each declare `npm run dev` for local preview,
`npm run build` for static output, and `npm run csv` for exporting lesson
metadata and links. The starter's `csv.js` defaults to `public/lessons.csv`
and `public/links.csv`. Override the paths with `OUTPUT_CSV_PATH` and
`LINKS_CSV_PATH`. Each project has its own package lock and legacy
dependencies.

The inherited Pages workflow is configured for the original `master` branch.
This adaptation publishes its course files on `main` for local use. The
original rendered course is hosted separately. [Original Vim Fundamentals site](https://theprimeagen.github.io/vim-fundamentals/).

## Credits and license

Brian Holt created the Gatsby course starter. ThePrimeagen wrote the original
Vim Fundamentals course. The repository-level license terms and full credits
apply here. [Gatsby course starter](https://github.com/btholt/gatsby-course-starter) · [Repository credits](../README.md#sources-and-credits).

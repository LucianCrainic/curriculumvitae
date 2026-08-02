# Curriculum Vitae

<!--
CV BANNER PLACEHOLDER
Replace this comment with the banner image, for example:
![Lucian Crainic - Curriculum Vitae](./assets/cv-banner.png)
-->

My professional curriculum vitae, available in light and dark themes matching [luciancrainic.github.io](https://luciancrainic.github.io).

## View the CV

| Light theme | Dark theme |
| :---: | :---: |
| [Open the light CV](./output/pdf/Lucian-Crainic-CV-light.pdf) | [Open the dark CV](./output/pdf/Lucian-Crainic-CV-dark.pdf) |

## Build

Both PDFs are generated from the shared content in `src/cv-content.tex` using [Tectonic](https://tectonic-typesetting.github.io/):

```sh
make
```

The light entry point is `src/main.tex`, and the dark entry point is `src/main-dark.tex`. The final PDFs are written to `output/pdf/`; temporary LaTeX build files are not committed.

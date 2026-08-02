<p align="center">
  <img src="./assets/cv-banner.png" alt="Lucian D. Crainic - Curriculum Vitae" width="100%">
</p>

<p align="center">
  <a href="./output/pdf/Lucian-Crainic-CV-light.pdf">
    <img src="https://img.shields.io/badge/OPEN-LIGHT_CV-4D55D7?style=for-the-badge" alt="Open the light CV">
  </a>
  &nbsp;
  <a href="./output/pdf/Lucian-Crainic-CV-dark.pdf">
    <img src="https://img.shields.io/badge/OPEN-DARK_CV-111316?style=for-the-badge" alt="Open the dark CV">
  </a>
</p>

# Curriculum Vitae

My professional curriculum vitae, available in light and dark themes matching [luciancrainic.github.io](https://luciancrainic.github.io).

## Build

Both PDFs are generated from the shared content in `src/cv-content.tex` using [Tectonic](https://tectonic-typesetting.github.io/):

```sh
make
```

The light entry point is `src/main.tex`, and the dark entry point is `src/main-dark.tex`. The final PDFs are written to `output/pdf/`; temporary LaTeX build files are not committed.

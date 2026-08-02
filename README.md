<p align="center">
  <img src="./assets/cv-banner.png" alt="Lucian D. Crainic - Curriculum Vitae" width="100%">
</p>

<p align="center">
  <a href="./output/pdf/Lucian-Crainic-CV-light.pdf">
    <img src="./assets/open-light-cv.png" alt="Open the light CV" width="360">
  </a>
  &nbsp;
  <a href="./output/pdf/Lucian-Crainic-CV-dark.pdf">
    <img src="./assets/open-dark-cv.png" alt="Open the dark CV" width="360">
  </a>
</p>

# Curriculum Vitae

My professional curriculum vitae, available in light and dark themes.

## Build

Both PDFs are generated from the shared content in `src/cv-content.tex` using [Tectonic](https://tectonic-typesetting.github.io/):

```sh
make
```

The light entry point is `src/main.tex`, and the dark entry point is `src/main-dark.tex`. The final PDFs are written to `output/pdf/`; temporary LaTeX build files are not committed.

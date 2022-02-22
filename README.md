# Ubermag website

## Building locally

```bash
conda env update  # alternatively: conda env create -f environment.yml -n ubermag-website
make prepare  # alternatively: make prepare-local
make html
make clean  # optional
```

## Preview
Point a browser to `build/html/index.html`

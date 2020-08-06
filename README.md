# build-hugo-site

A GitHub Action for building a Hugo site.

## Usage

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Build Hugo site
        uses: cariad/build-hugo-site@v0.1.1
```

The action will assume that the root of your repository contains your Hugo site's source, and will build to a `build` subdirectory.

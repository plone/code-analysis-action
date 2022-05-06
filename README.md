# Plone Code Analysis

This action provides many checks for Plone backend code.

## Inputs

## `check`

**Required** Type of check to run.

Possible checks:

* black
* isort
* flake8
* pyroma
* zpretty

## `path`

**Required** Path to check. Default `"src"`.

## `base_dir`

Base dir inside the repo.

## Examples

### Codebase in a sub-directory of the codebase


```yaml
name: Backend Code Analysis

on:
  push:
    paths:
      - "backend/**"

jobs:

  black:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout codebase
        uses: actions/checkout@v2

      - name: Run check
        uses: plone/code-analysis-action@v1
        with:
          base_dir: 'backend'
          check: 'black'
          path: |
            src/ploneconf.core/src
            src/ploneconf.core/setup.py
            scripts

  flake8:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout codebase
        uses: actions/checkout@v2

      - name: Run check
        uses: plone/code-analysis-action@v1
        with:
          base_dir: 'backend'
          check: 'flake8'
          path: |
            src/ploneconf.core/src
            src/ploneconf.core/setup.py
            scripts

  isort:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout codebase
        uses: actions/checkout@v2

      - name: Run check
        uses: plone/code-analysis-action@v1
        with:
          base_dir: 'backend'
          check: 'isort'
          path: |
            src/ploneconf.core/src
            src/ploneconf.core/setup.py
            scripts

  zpretty:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout codebase
        uses: actions/checkout@v2

      - name: Run check
        uses: plone/code-analysis-action@v1
        with:
          base_dir: 'backend'
          check: 'zpretty'
          path: src/ploneconf.core/src

```

## Contribute

- [Issue Tracker](https://github.com/plone/code-analysis-action/issues)
- [Source Code](https://github.com/plone/code-analysis-action/)
- [Documentation](https://github.com/plone/code-analysis-action/)

Please **DO NOT** commit to version branches directly. Even for the smallest and most trivial fix.

**ALWAYS** open a pull request and ask somebody else to merge your code. **NEVER** merge it yourself.


## Credits

Based on a solution originally developed by [kitconcept GmbH](https://kitconcept.com).

[![Plone Foundation](https://raw.githubusercontent.com/plone/.github/main/plone-foundation.png)](https://plone.org/)

## License

The project is licensed under the GPLv2.

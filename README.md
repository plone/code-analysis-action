<p align="center">
  <a href="https://hub.docker.com/r/plone/code-quality">
    <img alt="Plone Code Analysis GitHub Actions" width="200px" src="https://raw.githubusercontent.com/plone/code-analysis-action/main/docs/icon.png">
  </a>
</p>

<h1 align="center">
  Plone Code Analysis Action
</h1>

<div align="center">

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/plone/code-analysis-action)](https://github.com/plone/code-analysis-action)
![GitHub Repo stars](https://img.shields.io/github/stars/plone/code-analysis-action?style=flat-square)
[![license badge](https://img.shields.io/github/license/plone/code-analysis-action)](./LICENSE)

</div>


GitHub Action providing many checks for Plone backend code.

This action uses the [Plone Code Quality tool](https://github.com/plone/code-quality) docker image.


## Inputs

## `check`

**Optional** Type of check to run.

Possible checks:

* black
* isort
* flake8
* pyroma
* zpretty

## `path`

**Optional** Path to check.

## `base_dir`

Base dir inside the repo.

## `log_level`

Sets the logging verbosity. Default `INFO`

## Examples

### Run all checks

Considering your codebase has a `pyproject.toml` with settings like:

```toml
[tool.plone-code-analysis]
checkers = ["black", "flake8", "isort", "pyroma", "zpretty"]
paths = "src"
```

Adding a workflow with the following configuration:

```yaml
name: Backend Code Analysis

on: push

  checks:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout codebase
        uses: actions/checkout@v2

      - name: Run checks
        uses: plone/code-analysis-action@v2

```

will run all checks on the `src` folder of the codebase.

_Read about all possible configuration options on [Plone Code Quality tool documenation](https://github.com/plone/code-quality#configuration)._

### Run one check, default paths


```yaml
name: Backend Code Analysis

on: push

jobs:

  black:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout codebase
        uses: actions/checkout@v2

      - name: Run check
        uses: plone/code-analysis-action@v2
        with:
          base_dir: 'backend'
          check: 'black'

```

### Run one check, providing paths


```yaml
name: Backend Code Analysis

on: push

jobs:

  black:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout codebase
        uses: actions/checkout@v2

      - name: Run check
        uses: plone/code-analysis-action@v2
        with:
          base_dir: 'backend'
          check: 'black'
          path: |
            src/ploneconf.core/src
            src/ploneconf.core/setup.py
            scripts

```


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
        uses: plone/code-analysis-action@v2
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
        uses: plone/code-analysis-action@v2
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
        uses: plone/code-analysis-action@v2
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
        uses: plone/code-analysis-action@v2
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

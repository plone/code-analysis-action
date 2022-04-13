# kitconcept Code Analysis

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

## Example usage

uses: kitconcept/code-analysis-action@v1
with:
  check: 'black'
  path: 'src setup.py'

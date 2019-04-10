# Nix skeleton

Pre-requisites: `nix`, `direnv` and optionally `lorri`.

## Features

- Pinned `nixpkgs`.

## Usage

```bash
git init  # Or however you initialize your new project.
git pull https://github.com/enumatech/nix-skeleton $PROJECT_TYPE
```

## Project types

Note: please put project types on a specific branch, such as `python-poetry`
or `node-pnpm` and then add a link to the list below.

- [python-flit](https://github.com/enumatech/nix-skeleton/tree/python-flit):
  Python package without `setup.py` that uses `flit` for packaging.

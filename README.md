# Nix skeleton

Pre-requisites: [nix](https://nixos.org/nix/), optionally [direnv](https://direnv.net/).

## Development
```bash
nix-shell
# or with direnv
direnv allow
```

## Build docker container
```bash
nix-build container.nix
docker load --input result
```

## New project
```bash
git init  # Or however you initialize your new project.
git pull https://github.com/enumatech/nix-skeleton $PROJECT_TYPE
```

## Project types

Note: please put project types on a specific branch, such as `python-poetry`
or `node-pnpm` and then add a link to the list below.

- [python](https://github.com/enumatech/nix-skeleton/tree/python):
  Python package
- [python-src](https://github.com/enumatech/nix-skeleton/tree/python-src):
  Python package with package in `./src` subdirectory
- [python-flit](https://github.com/enumatech/nix-skeleton/tree/python-flit):
  Python package without `setup.py` that uses `flit` for packaging.
- [python-poetry](https://github.com/enumatech/nix-skeleton/tree/python-poetry):
  Python package without `setup.py` that uses `poetry` for packaging and the
  development environment.

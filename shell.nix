# Setup dev env using mkShell. Takes opt {pkgs} defaults to pinned `nixpkgs.nix`. Used by `nix-shell`.
{ pkgs ? import nix/nixpkgs.nix {} }:

with pkgs;

let
  python = python3;
  pkg = callPackage ./default.nix { python = python3; };
in mkShell {

  buildInputs = [

    (python.withPackages (ps: with ps; [

        pytest
        black

        (pkg.overridePythonAttrs (old: {
          doCheck = false;
        }))

    ]))
  ];

  # don't create .pyc files
  PYTHONDONTWRITEBYTECODE = "1";
}

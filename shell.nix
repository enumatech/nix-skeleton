# Setup dev env using mkShell. Takes opt {pkgs} defaults to pinned `nixpkgs.nix`. Used by `nix-shell`.
{ pkgs ? import nix/nixpkgs.nix {} }:
with pkgs;

let pkg = callPackage ./default.nix {};

in mkShell {
  buildInputs = [
    pkg
  ];
}

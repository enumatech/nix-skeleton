# Setup dev env using mkShell. Takes opt {pkgs} defaults to pinned `nixpkgs.nix`. Used by `nix-shell`.
{ pkgs ? import nix/nixpkgs.nix {} }:

pkgs.mkShell {
  buildInputs = [
    # dev dependencies go here
  ];
}

# Setup dev env using mkShell. Takes opt {pkgs} defaults to pinned `nixpkgs.nix`. Used by `nix-shell`.
{ pkgs ? import nix/nixpkgs.nix {
  overlays = [ (import ./nix/overlay.nix) ];
} }:

# Replacing everything below with `pkgs.python3.pkgs.my-pkg` works too,
# but don't know how to add extra development dependencies in that
# case.

with pkgs;

let pkg = python3.pkgs.my-pkg;
in mkShell {

  buildInputs = [
    # any extra dev dependencies
  ] ++ pkg.buildInputs ++ pkg.propagatedBuildInputs;

  shellHook = pkg.shellHook;

}

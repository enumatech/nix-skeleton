# Setup dev env using mkShell. Takes opt {pkgs} defaults to pinned `nixpkgs.nix`. Used by `nix-shell`.
{ pkgs ? import nix/nixpkgs.nix {} }:
with pkgs;

let
  pkg = import ./default.nix { inherit pkgs; };

in mkShell {

  buildInputs = [
    # additional runtime dependencies go here
  ] ++ pkg.buildInputs ++ pkg.propagatedBuildInputs;

  nativeBuildInputs = [
    # additional dev dependencies go here
  ] ++ pkg.nativeBuildInputs;

}

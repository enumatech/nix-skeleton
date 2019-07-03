# Setup dev env using mkShell. Takes opt {pkgs} defaults to pinned `nixpkgs.nix`. Used by `nix-shell`.
{ pkgs ? import nix/nixpkgs.nix {
  overlays = [ (import ./nix/overlay.nix) ];
} }:

with pkgs;

python3.pkgs.my-pkg.overridePythonAttrs(old: {
  propagatedBuildInputs = (old.propagatedBuildInputs or []) ++ [
    entr
    python3.pkgs.flake8
    python3.pkgs.black
    # whatever else you need
  ];
})

# Setup dev env using mkShell. Takes opt {pkgs} defaults to pinned `nixpkgs.nix`. Used by `nix-shell`.
{ pkgs ? import nix/nixpkgs.nix {
  overlays = [ (import ./nix/overlay.nix) ];
} }:

with pkgs;

python3.pkgs.my-pkg.overridePythonAttrs(old: {
  nativeBuildInputs = old.nativeBuildInputs ++ [
    entr
    python3.pkgs.flake8
    # whatever else you need
  ];
  PYTHONDONTWRITEBYTECODE = "1";
})

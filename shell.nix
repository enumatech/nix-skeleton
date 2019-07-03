# Setup dev env using mkShell. Takes opt {pkgs} defaults to pinned `nixpkgs.nix`. Used by `nix-shell`.
{ pkgs ? import nix/nixpkgs.nix {
  overlays = [ (import ./nix/overlay.nix) ];
} }:

with pkgs;

mkShell {

  buildInputs = [
    (python3.withPackages (ps: with ps; [
      (my-pkg.overridePythonAttrs (old: {
        doCheck = false;
      }))
    ]))
  ];

}

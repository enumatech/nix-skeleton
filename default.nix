{ pkgs ? import nix/nixpkgs.nix { } }:
with pkgs;

stdenv.mkDerivation {

  name = "myapp";
  src = lib.cleanSource ./.;

  installPhase = ''
    mkdir -p $out/bin
    cp hello $out/bin
  '';

  buildInputs = [
    # dependencies go here
  ];

}

{ pkgs ? import nix/nixpkgs.nix { }, python ? pkgs.python3}:

with python.pkgs;

buildPythonPackage {
  name = "mypkg";
  src = pkgs.lib.cleanSource ./.;
  format = "flit";

  doCheck = true;
  checkInputs = [ pytest ];
  checkPhase = "pytest";
}

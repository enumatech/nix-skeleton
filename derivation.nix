{ pkgs }:
pkgs.stdenv.mkDerivation {
  name = "myapp";
  src = ./.;
  buildInputs = [
    # dependencies go here
  ];
}

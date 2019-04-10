let
  pkgs = import <nixpkgs> { };
  pinnedNixpkgs = pkgs.lib.importJSON ./nix/nixpkgs.json;
in
with import (
  builtins.fetchTarball {
    url = pinnedNixpkgs.url;
    sha256 = pinnedNixpkgs.sha256;
  }
) { };

with python3.pkgs;

mkShell {
  buildInputs = [

    (buildPythonPackage {
      name = "mypkg";
      src = ./.;
      format = "flit";

      propagatedBuildInputs = [
        pytest
        black
      ];

      # checkInputs = [ pytest ];
      # checkPhase = "pytest";
      # doCheck = true;

      # don't create .pyc files
      PYTHONDONTWRITEBYTECODE = "1";
    })

  ];
}

{ lib, buildPythonPackage, click, pytest, poetry }:

buildPythonPackage {

  name = "my-pkg";
  src = lib.cleanSource ./.;
  format = "pyproject";

  propagatedBuildInputs = [
    click
    poetry
  ];

  doCheck = true;
  checkPhase = ''
    pytest
  '';
  checkInputs = [ pytest ];

}

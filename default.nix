{ lib, buildPythonPackage, click, pytest }:

buildPythonPackage {

  name = "my-pkg";
  src = lib.cleanSource ./.;

  propagatedBuildInputs = [
    click
  ];

  checkInputs = [
    pytest
  ];
  checkPhase = "pytest";

  nativeBuildInputs = [
    # build dependencies go here
  ];

}

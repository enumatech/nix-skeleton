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

  nativeBuildInputs = [
    # build dependencies go here
  ];

}

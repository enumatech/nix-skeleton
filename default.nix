{ lib, buildPythonPackage, setuptools, click, pytest }:

buildPythonPackage {

  name = "my-pkg";
  src = lib.cleanSource ./.;
  format = "flit";

  propagatedBuildInputs = [
    click
    setuptools
  ];

  checkInputs = [
    pytest
  ];

}

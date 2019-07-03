{ lib, buildPythonPackage, click }:

buildPythonPackage {

  name = "my-pkg";
  src = lib.cleanSource ./.;

  propagatedBuildInputs = [
    click
  ];

  nativeBuildInputs = [
    # build dependencies go here
  ];

}

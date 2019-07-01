{ buildPythonPackage
, flask
}:

buildPythonPackage {

  pname = "my-app";
  version = "0.0.1";
  doCheck = false;

  propagatedBuildInputs = [
    flask
  ];

  src = ./.;

}

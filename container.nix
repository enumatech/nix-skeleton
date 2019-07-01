with (import <nixpkgs> {
  overlays = [
    (self: super: let
      overridePython = pypkgs: let
        packageOverrides = pyself: pysuper: {
            my-app = pysuper.callPackage ./default.nix {};
        };
      in pypkgs.override { inherit packageOverrides; };
    in {
      python3 = overridePython super.python3;
    })
  ];
});

{ project ? "my-cool-project" }:

let
  app = with python3.pkgs; buildPythonPackage {
    name = "app";
    propagatedBuildInputs = [ my-app gunicorn ];
    unpackPhase = "true";
    phases = [ "installPhase" ];
    doCheck = false;
    installPhase = ''
      makeWrapper ${gunicorn}/bin/gunicorn $out/bin/app \
        --set PYTHONPATH $PYTHONPATH \
        --run 'export GUNICORN_CMD_ARGS="--bind=0.0.0.0:''${PORT:-8080} --workers=1"'
    '';
  };
  env = python3.withPackages (ps: with ps; [
    app
  ]);
in dockerTools.buildImage {
  name = "gcr.io/${project}/my-app";
  tag = "latest";
  config = {
    Cmd = [
      "${env}/bin/app" "app.app:setup()"
    ];
    ExposedPorts = {
      "8080/tcp" = {};
    };
  };
}

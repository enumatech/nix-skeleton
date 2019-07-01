with import <nixpkgs> {
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
};

let
  devDeps = ps: with ps; [
      black
      gunicorn
      ipython
      pyls-black
      pyls-isort
      python-language-server
      my-app

      rope
  ];
in mkShell {
  buildInputs = [
    (python3.withPackages devDeps)
  ];
}

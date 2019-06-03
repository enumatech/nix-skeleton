# To create a minimal docker container do the following:
# nix-build container.nix
# docker load --input result

# Using <nixpkgs> here (as opposed to ./nixpkgs.nix) to avoid having to
# build the docker tooling.
{ pkgs ? import <nixpkgs> {} }:

let
  myapp = import ./default.nix {};

in pkgs.dockerTools.buildImage {
  name = myapp.name;
  tag = "latest";
  # runAsRoot = ''
  #   #!${stdenv.shell}
  #   ${pkgs.dockerTools.shadowSetup}
  #   useradd --system nobody
  # '';
  # contents = [ pkgs.coreutils pkgs.bash ];  # any pkgs other than myapp
  config = {
    #User = "nobody";
    WorkingDir = "${myapp}";
    Env = [
      "HTTP_PLATFORM_PORT=80"
    ];
    Cmd = [
      "${myapp}/bin/myapp"
      "--user"
      "nobody"
    ];
    ExposedPorts = {
      "80/tcp" = {};
    };
  };
}

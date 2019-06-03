# Uses `callPackage` to the app's derivation. Shouldn't need any other customization. Used by `nix-build`.
{ pkgs ? import nix/nixpkgs.nix {} }:
pkgs.callPackage ./derivation.nix {}

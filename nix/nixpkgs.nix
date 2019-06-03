# Behaves like `<nixpkgs>` but pinned. Like `<nixpkgs>`, requires attrset for opt overlays.
attrs:
let
  hostpkgs = import <nixpkgs> {};
#   nixpkgs = hostpkgs.fetchFromGitHub {
#     owner = "NixOS";
#     repo = "nixpkgs";
#     rev = "61f0936d1cd73760312712615233cd80195a9b47";
#     sha256 = "1fkmp99lxd827km8mk3cqqsfmgzpj0rvaz5hgdmgzzyji70fa2f8";
#   };
  pinnedNixpkgs = hostpkgs.lib.importJSON ./nixpkgs.json;
  nixpkgs = builtins.fetchTarball {
    url = pinnedNixpkgs.url;
    sha256 = pinnedNixpkgs.sha256;
  };
in import nixpkgs attrs
# Or, an example with default `overlays`:
#   overlayXyz = self: super: { xyz = super.xyz.overrideAttrs(old: {}); };
# in import nixpkgs ({ overlays = [ overlayXyz ]; } // attrs)

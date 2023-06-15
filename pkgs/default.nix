{ pkgs ? import <nixpkgs> { } }: rec {
  luau-lsp = pkgs.callPackage ./luau-lsp { };
}

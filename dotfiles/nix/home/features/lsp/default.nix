{ pkgs, ... }:
with pkgs; [
        rnix-lsp
        rust-analyzer
        nodePackages.typescript-language-server
]
{ inputs, outputs, lib, config, pkgs, ... }: {
        home.packages = with pkgs; [
                rnix-lsp
                rust-analyzer
                nodePackages.typescript-language-server
        ];
}

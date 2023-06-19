{ inputs, outputs, lib, config, pkgs, ... }: {
        home = {
                username = "zack";
                homeDirectory = "/Users/${config.home.username}";
        };

        imports = [
                ../../features/lsp
                ../../features/nvim
                ../../features/font
                ../../features/kitty
                ../../features/zsh
                ../../../system/home-manager
        ];
}

{ inputs, outputs, lib, config, pkgs, ... }: {
        home = {
                username = "zack";
                homeDirectory = "/Users/${config.home.username}";
        };

        imports = [
                ../../../../system/home-manager
                ../../features/lsp
                ../../features/nvim
        ];
}

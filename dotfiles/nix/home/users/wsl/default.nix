{ inputs, outputs, lib, config, pkgs, ... }: {
        home = {
                username = "zack-wsl";
                homeDirectory = "/home/${config.home.username}";
        };

        imports = [
                ../../features/lsp
                ../../features/nvim
                ../../../system/home-manager
        ];
}

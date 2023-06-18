{ inputs, outputs, lib, config, pkgs, ... }: {
        home = {
                username = "zack-wsl";
                homeDirectory = "/home/zack-wsl";
        };

        imports = [
                ../../features/lsp
                ../../features/nvim
                ../../../system/home-manager
        ];
}

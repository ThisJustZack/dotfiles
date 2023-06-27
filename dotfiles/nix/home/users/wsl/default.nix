{ inputs, outputs, lib, config, pkgs, ... }: {
        home = {
                username = "zack-wsl";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
        };

        imports = [
                ../../features/lsp
                ../../features/nvim
                ../../../system/home-manager
        ];
}

{ config, pkgs, ... }: {
        imports = [
                ../../../system/os/home-manager
                ../../features
        ];

        home = {
                username = "zack-wsl";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
        };

        features.user.font.fira-code.enable = true;
        features.user.software-development.javascript.enable = true;
        features.user.software-development.nix.enable = true;
        features.user.software-development.rust.enable = true;
        features.user.software-development.typescript.enable = true;
        features.user.editor.nvim.enable = true;
}

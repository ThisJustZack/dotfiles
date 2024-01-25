{ config, pkgs, ... }: {
        imports = [
                ../../../system/home-manager
                ../../features
                ../../features/editor/nvim
        ];

        home = {
                username = "zack-wsl";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
        };

        features.font.fira-code.enable = true;
        features.software-development.javascript.enable = true;
        features.software-development.nix.enable = true;
        features.software-development.rust.enable = true;
        features.software-development.typescript.enable = true;
}

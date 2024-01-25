{ config, pkgs, ... }: {
        imports = [
                ../../../system/home-manager
                ../../features
        ];

        home = {
                username = "zack";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
        };

        features.application-linking.mac.enable = true;
        features.terminal.kitty.enable = true;
        features.shell.zsh.enable = true;
        features.command-line.starship.enable = true;
        features.software-development.javascript.enable = true;
        features.software-development.nix.enable = true;
        features.software-development.rust.enable = true;
        features.software-development.typescript.enable = true;
        features.editor.nvim.enable = true;
}

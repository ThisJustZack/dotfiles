{ config, pkgs, ... }: {
        imports = [
                ../../../system/os/home-manager
                ../../features
        ];

        home = {
                username = "zack";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
        };

        features.user.terminal.kitty.enable = true;
        features.user.shell.zsh.enable = true;
        features.user.command-line.starship.enable = true;
        features.user.software-development.javascript.enable = true;
        features.user.software-development.rust.enable = true;
        features.user.software-development.typescript.enable = true;
        features.user.editor.nvim.enable = true;
        features.user.editor.vs-code.enable = true;
        features.user.version-control.git.enable = true;
        features.user.password-manager.bitwarden.enable = true;
        features.user.streaming-service.spotify.enable = true;
        features.user.peripheral.keyboard.wooting.enable = true;
        features.user.peripheral.printer.epson-et8550.enable = true;
        features.user.communication-service.discord.enable = true;

}

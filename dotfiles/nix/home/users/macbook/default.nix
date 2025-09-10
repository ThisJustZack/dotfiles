{ user, config, pkgs, ... }: {
        imports = [
                ../../../system/os/home-manager
                ../../features
        ];

        home = {
                username = user;
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${user}" else "/home/${user}";
        };

        features.user.application-linking.mac.enable = true;
        features.user.terminal.kitty.enable = true;
        features.user.shell.zsh.enable = true;
        features.user.command-line.starship.enable = true;
        features.user.software-development.rust.enable = true;
        features.user.editor.nvim.enable = true;
}

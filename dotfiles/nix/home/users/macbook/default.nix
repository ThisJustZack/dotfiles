{ config, pkgs, ... }: {
        imports = [
                ../../../system/home-manager
                ../../features/application-linking/darwin
                ../../features/editor/nvim
                ../../features/terminal/kitty
                ../../features/shell/zsh
                ../../features/command-line/enhancement/starship
        ];

        home = {
                username = "zack";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
                packages = with pkgs; []
                        ++ callPackage ../../features/command-line/lsp {}
                        ++ callPackage ../../features/command-line/development/rust {}
                        ++ callPackage ../../features/font {};
        };
}

{ config, pkgs, ... }: {
        imports = [
                ../../../system/home-manager
                ../../features/application-linking/darwin
                ../../features/editor/nvim
                ../../features/terminal/kitty
                ../../features/shell/zsh
                ../../features/command-line/starship
        ];

        home = {
                username = "zack";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
                packages = with pkgs; []
                        ++ callPackage ../../features/software-development/javascript {}
                        ++ callPackage ../../features/software-development/nix {}
                        ++ callPackage ../../features/software-development/rust {}
                        ++ callPackage ../../features/software-development/typescript {}
                        ++ callPackage ../../features/font {};
        };
}

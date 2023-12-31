{ config, pkgs, ... }: {
        imports = [
                ../../../system/home-manager
                ../../features/editor/nvim
        ];

        home = {
                username = "zack-wsl";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
                packages = with pkgs; []
                        ++ callPackage ../../features/command-line/lsp {};
        };
}

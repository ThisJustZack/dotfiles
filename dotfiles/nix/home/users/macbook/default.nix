{ config, pkgs, ... }: {
        imports = [
                ../../../system/home-manager
                ../../features/nvim
                ../../features/kitty
                ../../features/zsh
        ];

        # homebrew.formulae = []
        #         ++ callPackage ../../features/formulae {};

        # homebrew.casks = []
        #         ++ callPackage ../../features/casks {};

        home = {
                username = "zack";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
                packages = with pkgs; []
                        ++ callPackage ../../features/lsp {}
                        ++ callPackage ../../features/font {};
        };
}

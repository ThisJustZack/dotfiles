{ inputs, outputs, lib, config, pkgs, ... }: {
        home = {
                username = "zack-wsl";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
                packages = with pkgs; []
                        // callPackage ../../features/lsp {};
        };

        imports = [
                ../../features/nvim
                ../../../system/home-manager
        ];
}

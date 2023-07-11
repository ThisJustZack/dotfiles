{ config, pkgs, ... }: {
        imports = [
                ../../../system/home-manager
        ];

        home = {
                username = "template";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
        };
}

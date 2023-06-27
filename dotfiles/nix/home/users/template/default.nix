{ inputs, outputs, lib, config, pkgs, ... }: {
        home = {
                username = "template";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
        };

        imports = [
                ../../../system/home-manager
        ];
}

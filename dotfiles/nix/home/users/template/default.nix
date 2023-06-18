{ inputs, outputs, lib, config, pkgs, ... }: {
        home = {
                username = "template";
                homeDirectory = "/home/${config.home.username}" || "/Users/${config.home.username}";
        };

        imports = [
                ../../../../system/home-manager
        ];
}

{ inputs, outputs, lib, config, pkgs, ... }: {
        programs.home-manager.enable = true;

        systemd.user.startServices = "sd-switch";

        home.stateVersion = "25.05";
}

{ inputs, outputs, lib, config, pkgs, ... }: {
    imports = [ ../../features ];

    features.system.bootloader.grub.enable = true;
    features.system.networking.enable = true;

    networking.hostName = "nixos";

    features.system.time-zone.us-east-coast.enable = true;
    features.system.locale.us.enable = true;

    features.system.login-environment.sddm.enable = true;
    features.system.desktop-environment.kde.enable = true;

    features.system.printing.enable = true;
    features.system.audio.enable = true;

    system.stateVersion = "25.05";
}

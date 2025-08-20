{ inputs, outputs, lib, config, pkgs, ... }: {
    imports = [ ./system-features ];

    system-features.bootloader.grub.enable = true;
    system-features.networking.enable = true;

    networking.hostName = "nixos";

    system-features.time-zone.us-east-coast.enable = true;
    system-features.locale.us.enable = true;

    system-features.login-environment.sddm.enable = true;
    system-features.desktop-environment.kde.enable = true;

    system-features.printing.enable = true;
    system.features.audio.pipewire.enable = true;

    services.displayManager.autoLogin.enable = true;
    services.displayManager.autoLogin.user = "zack";

    system.stateVersion = "25.05";
}

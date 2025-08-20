{ lib, pkgs, config, ... }: {
        imports = [
                ./audio/pipewire
                ./bootloader/grub
                ./desktop-environment/cosmic
                ./desktop-environment/hyprland
                ./desktop-environment/kde
                ./locale/us
                ./login-environment/cosmic-greeter
                ./login-environment/sddm
                ./networking
                ./printing/cups
                ./time-zone/us-east-coast
        ];
}
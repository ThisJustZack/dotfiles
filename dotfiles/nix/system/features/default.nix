{ lib, pkgs, config, ... }: {
        imports = [
                ./audio
                ./bootloader/grub
                ./desktop-environment/cosmic
                ./desktop-environment/gnome
                ./desktop-environment/hyprland
                ./desktop-environment/kde
                ./locale/us
                ./login-environment/cosmic-greeter
                ./login-environment/gdm
                ./login-environment/sddm
                ./networking
                ./printing
                ./time-zone/us-east-coast
        ];
}
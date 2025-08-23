{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.bootloader.grub;

in {
        options.features.system.bootloader.grub = {
                enable = mkEnableOption "grub";
        };
        config = mkIf cfg.enable {
                boot.loader.grub = {
                        enable = true;
                        device = "/dev/sda";
                        useOSProber = true;
                };
        };
}

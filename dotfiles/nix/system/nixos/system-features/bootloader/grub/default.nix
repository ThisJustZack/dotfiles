{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.bootloader.grub;

in {
        options.system-features.bootloader.grub = {
                enable = mkEnableOption "grub";
        };
        config = mkIf cfg.enable {
                boot.loader.grub = {
                        enable = true;
                        device = "/dev/vda";
                        useOSProber = true;
                };
        };
}

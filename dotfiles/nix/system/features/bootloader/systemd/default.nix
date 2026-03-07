{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.bootloader.systemd;

in {
        options.features.system.bootloader.systemd = {
                enable = mkEnableOption "systemd";
        };
        config = mkIf cfg.enable {
                boot = {
                        loader = {
                                efi.canTouchEfiVariables = true;
                                systemd-boot = {
                                        enable = true;
                                        configurationLimit = 3;
                                };
                        };

                        plymouth = {
                                enable = true;
                                theme = "bgrt";
                                themePackages = with pkgs; [
                                        nixos-bgrt-plymouth
                                ];
                        };

                        consoleLogLevel = 3;
                        initrd.verbose = false;
                        kernelParams = [
                                "quiet"
                                "udev.log_level=3"
                        ];
                };
        };
}

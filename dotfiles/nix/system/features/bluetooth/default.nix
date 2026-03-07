{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.bluetooth;

in {
        options.features.system.bluetooth = {
                enable = mkEnableOption "bluetooth";
        };
        config = mkIf cfg.enable {
                hardware.bluetooth = {
                        enable = true;
                        powerOnBoot = true;
                        package = pkgs.bluez;
                        settings = {
                                General = {
                                        Experimental = true;
                                };
                        };
                };

                environment.systemPackages = with pkgs; [ bluez bluez-tools ];
        };
}
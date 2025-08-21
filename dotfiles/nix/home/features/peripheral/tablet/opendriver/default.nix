{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.peripheral.tablet.opendriver;

in {
        options.features.user.peripheral.tablet.opendriver = {
                enable = mkEnableOption "opendriver";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        opentabletdriver
                ];
        };
}

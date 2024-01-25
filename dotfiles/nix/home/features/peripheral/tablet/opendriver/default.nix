{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.peripheral.tablet.opendriver;

in {
        options.features.peripheral.tablet.opendriver = {
                enable = mkEnableOption "opendriver";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        opentabletdriver
                ];
        };
}

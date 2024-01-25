{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.gaming.bottles;

in {
        options.features.gaming.bottles = {
                enable = mkEnableOption "bottles";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        bottles
                ];
        };
}

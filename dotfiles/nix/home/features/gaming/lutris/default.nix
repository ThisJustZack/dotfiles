{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.gaming.lutris;

in {
        options.features.gaming.lutris = {
                enable = mkEnableOption "lutris";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        lutris
                ];
        };
}

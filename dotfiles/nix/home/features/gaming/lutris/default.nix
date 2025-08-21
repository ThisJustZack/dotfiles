{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.gaming.lutris;

in {
        options.features.user.gaming.lutris = {
                enable = mkEnableOption "lutris";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        lutris
                ];
        };
}

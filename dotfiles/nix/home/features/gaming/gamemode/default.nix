{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.gaming.gamemode;

in {
        options.features.gaming.gamemode = {
                enable = mkEnableOption "gamemode";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        gamemode
                ];
        };
}

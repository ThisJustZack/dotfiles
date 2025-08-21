{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.gaming.gamemode;

in {
        options.features.user.gaming.gamemode = {
                enable = mkEnableOption "gamemode";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        gamemode
                ];
        };
}

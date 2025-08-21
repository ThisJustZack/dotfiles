{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.gaming.steam;

in {
        options.features.user.gaming.steam = {
                enable = mkEnableOption "steam";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        steam
                ];
        };
}

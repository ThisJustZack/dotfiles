{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.gaming.steam;

in {
        options.features.gaming.steam = {
                enable = mkEnableOption "steam";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        steam
                ];
        };
}

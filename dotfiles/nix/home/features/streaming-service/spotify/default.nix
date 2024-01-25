{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.streaming-service.spotify;

in {
        options.features.streaming-service.spotify = {
                enable = mkEnableOption "spotify";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        spotify
                ];
        };
}

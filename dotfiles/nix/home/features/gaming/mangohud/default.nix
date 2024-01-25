{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.gaming.mangohud;

in {
        options.features.gaming.mangohud = {
                enable = mkEnableOption "mangohud";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        mangohud
                ];
        };
}

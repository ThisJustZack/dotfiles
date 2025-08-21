{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.gaming.mangohud;

in {
        options.features.user.gaming.mangohud = {
                enable = mkEnableOption "mangohud";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        mangohud
                ];
        };
}

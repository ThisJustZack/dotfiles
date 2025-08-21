{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.gaming.protonup;

in {
        options.features.user.gaming.protonup = {
                enable = mkEnableOption "protonup";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        protonup-qt
                ];
        };
}

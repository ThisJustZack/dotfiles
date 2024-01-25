{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.gaming.protonup;

in {
        options.features.gaming.protonup = {
                enable = mkEnableOption "protonup";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        protonup-qt
                ];
        };
}

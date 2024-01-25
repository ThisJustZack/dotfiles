{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.font.fira-code;

in {
        options.features.font.fira-code = {
                enable = mkEnableOption "fira-code";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        fira-code
                ];
        };
}

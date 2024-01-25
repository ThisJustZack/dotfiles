{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.gaming.template;

in {
        options.features.gaming.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

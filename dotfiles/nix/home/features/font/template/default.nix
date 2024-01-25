{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.font.template;

in {
        options.features.font.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

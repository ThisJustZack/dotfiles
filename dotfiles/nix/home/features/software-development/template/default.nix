{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.software-development.template;

in {
        options.features.software-development.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

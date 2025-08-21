{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.software-development.template;

in {
        options.features.user.software-development.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

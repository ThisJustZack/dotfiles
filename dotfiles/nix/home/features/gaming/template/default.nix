{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.gaming.template;

in {
        options.features.user.gaming.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.font.template;

in {
        options.features.user.font.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

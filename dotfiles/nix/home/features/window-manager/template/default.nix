{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.window-manager.template;

in {
        options.features.window-manager.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.password-manager.template;

in {
        options.features.password-manager.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

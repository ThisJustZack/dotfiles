{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.password-manager.template;

in {
        options.features.user.password-manager.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.browser.template;

in {
        options.features.user.browser.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

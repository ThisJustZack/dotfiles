{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.browser.template;

in {
        options.features.browser.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

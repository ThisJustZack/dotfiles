{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.browser.firefox;

in {
        options.features.browser.firefox = {
                enable = mkEnableOption "firefox";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        firefox
                ];
        };
}

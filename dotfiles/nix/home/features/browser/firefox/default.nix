{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.browser.firefox;

in {
        options.features.user.browser.firefox = {
                enable = mkEnableOption "firefox";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        firefox
                ];
        };
}

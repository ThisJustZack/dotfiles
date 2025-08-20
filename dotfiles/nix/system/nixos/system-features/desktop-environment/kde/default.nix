{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.desktop-environment.kde;

in {
        options.system-features.desktop-environment.kde = {
                enable = mkEnableOption "kde";
        };
        config = mkIf cfg.enable {
                services.desktopManager.plasma6.enable = true;
        };
}

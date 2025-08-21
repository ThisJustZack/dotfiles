{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.desktop-environment.kde;

in {
        options.features.system.desktop-environment.kde = {
                enable = mkEnableOption "kde";
        };
        config = mkIf cfg.enable {
                services.desktopManager.plasma6.enable = true;
        };
}

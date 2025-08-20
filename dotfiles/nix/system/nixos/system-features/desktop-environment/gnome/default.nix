{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.desktop-environment.gnome;

in {
        options.system-features.desktop-environment.gnome = {
                enable = mkEnableOption "gnome";
        };
        config = mkIf cfg.enable {
                services.desktopManager.gnome.enable = true;
        };
}

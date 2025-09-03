{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.desktop-environment.gnome;

in {
        options.features.system.desktop-environment.gnome = {
                enable = mkEnableOption "gnome";
        };
        config = mkIf cfg.enable {
                services.xserver = {
                        enable = true;
                        desktopManager.gnome.enable = true;
                };
                #services.desktopManager.gnome.enable = true; # 25.11
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.desktop-environment.hyprland;

in {
        options.features.system.desktop-environment.hyprland = {
                enable = mkEnableOption "hyprland";
        };
        config = mkIf cfg.enable {
                xdg.portal = {
                        enable = true;
                        extraPortals = [
                                pkgs.xdg-desktop-portal-hyprland
                        ];
                };

                programs.hyprland.enable = true;
        };
}

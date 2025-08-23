{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.desktop-environment.hyprland;

in {
        options.features.system.desktop-environment.hyprland = {
                enable = mkEnableOption "hyprland";
        };
        config = mkIf cfg.enable {
                programs.hyprland = {
                        enable = true;
                        withUWSM = true;
                        xwayland.enable = true;
                };
        };
}

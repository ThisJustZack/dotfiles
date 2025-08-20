{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.desktop-environment.hyprland;

in {
        options.system-features.desktop-environment.hyprland = {
                enable = mkEnableOption "hyprland";
        };
        config = mkIf cfg.enable {
                programs.hyprland = {
                        enable = true;
                        withUSM = true;
                        xwayland.enable = true;
                }
        };
}

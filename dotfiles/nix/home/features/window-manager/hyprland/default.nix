{ lib, pkgs, config, inputs, ... }: 
with lib;
let cfg = config.features.window-manager.hyprland;

in {
        imports = [ inputs.hyprland.homeManagerModules.default ];

        options.features.window-manager.hyprland = {
                enable = mkEnableOption "hyprland";
        };
        config = mkIf cfg.enable {
                wayland.windowManager.hyprland = {
                        enable = true;
                        systemd.enable = true;
                };
        };
}

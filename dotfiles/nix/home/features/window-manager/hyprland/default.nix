{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.window-manager.hyprland;

in {
        options.features.window-manager.hyprland = {
                enable = mkEnableOption "hyprland";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        hyprland
                ];
        };
}

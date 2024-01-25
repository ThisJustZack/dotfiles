{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.window-manager.mutter;

in {
        options.features.window-manager.mutter = {
                enable = mkEnableOption "mutter";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        gnome.mutter
                ];
        };
}

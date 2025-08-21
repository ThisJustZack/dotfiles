{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.obsidian;

in {
        options.features.user.editor.obsidian = {
                enable = mkEnableOption "obsidian";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        obsidian
                ];
        };
}

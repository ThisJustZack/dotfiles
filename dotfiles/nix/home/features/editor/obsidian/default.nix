{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.obsidian;

in {
        options.features.editor.obsidian = {
                enable = mkEnableOption "obsidian";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        obsidian
                ];
        };
}

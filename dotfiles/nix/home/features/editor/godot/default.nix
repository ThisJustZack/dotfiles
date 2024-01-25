{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.godot;

in {
        options.features.editor.godot = {
                enable = mkEnableOption "godot";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        godot_4
                ];
        };
}

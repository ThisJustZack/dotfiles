{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.godot;

in {
        options.features.user.editor.godot = {
                enable = mkEnableOption "godot";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        godot_4
                ];
        };
}

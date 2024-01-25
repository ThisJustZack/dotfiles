{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.template;

in {
        options.features.editor.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

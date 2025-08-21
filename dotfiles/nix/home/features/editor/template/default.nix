{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.template;

in {
        options.features.user.editor.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

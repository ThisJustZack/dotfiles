{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.shell.template;

in {
        options.features.shell.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
        };
}

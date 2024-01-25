{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.command-line.template;

in {
        options.features.command-line.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
        };
}

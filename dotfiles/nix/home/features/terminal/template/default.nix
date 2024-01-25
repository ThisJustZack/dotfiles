{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.terminal.template;

in {
        options.features.terminal.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.terminal.template;

in {
        options.features.user.terminal.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
        };
}

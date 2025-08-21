{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.shell.template;

in {
        options.features.user.shell.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.command-line.template;

in {
        options.features.user.command-line.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
        };
}

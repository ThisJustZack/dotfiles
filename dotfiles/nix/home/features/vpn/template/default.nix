{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.vpn.template;

in {
        options.features.vpn.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

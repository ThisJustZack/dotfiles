{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.vpn.template;

in {
        options.features.user.vpn.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

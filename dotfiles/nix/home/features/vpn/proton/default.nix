{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.vpn.proton;

in {
        options.features.user.vpn.proton = {
                enable = mkEnableOption "proton";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        protonvpn-gui
                ];
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.vpn.proton;

in {
        options.features.vpn.proton = {
                enable = mkEnableOption "proton";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        protonvpn-gui
                ];
        };
}

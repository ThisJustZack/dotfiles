{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.networking;

in {
        options.system-features.networking = {
                enable = mkEnableOption "networking";
        };
        config = mkIf cfg.enable {
                networking.networkmanager.enable = true;
        };
}

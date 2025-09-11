{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.networking;

in {
        options.features.system.networking = {
                enable = mkEnableOption "networking";
        };
        config = mkIf cfg.enable {
                networking.networkmanager.enable = true;
                users.groups.networkmanager.members = [ user ];
        };
}

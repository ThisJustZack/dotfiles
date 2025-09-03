{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.gaming.steam;

in {
        options.features.user.gaming.steam = {
                enable = mkEnableOption "steam";
        };
        config = mkIf cfg.enable {
                programs.steam = {
                        enable = true;
                        remotePlay.openFirewall = true;
                        dedicatedServer.openFirewall = true;
                        localNetworkGameTransfers.openFirewall = true;
                        gamescopeSession.enable = true;
                };
        };
}

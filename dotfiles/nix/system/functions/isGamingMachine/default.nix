{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.functions.system.isGamingMachine;

in {
        options.functions.system.isGamingMachine = {
                enable = mkEnableOption "isGamingMachine";
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

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.communication-service.discord;

in {
        options.features.user.communication-service.discord = {
                enable = mkEnableOption "discord";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        discord
                ];
        };
}

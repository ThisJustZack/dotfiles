{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.streaming-service.template;

in {
        options.features.user.streaming-service.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

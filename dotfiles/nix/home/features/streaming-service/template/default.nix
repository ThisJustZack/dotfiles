{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.streaming-service.template;

in {
        options.features.streaming-service.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.communication-service.template;

in {
        options.features.communication-service.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

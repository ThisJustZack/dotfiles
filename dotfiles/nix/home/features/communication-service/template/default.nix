{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.communication-service.template;

in {
        options.features.user.communication-service.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                ];
        };
}

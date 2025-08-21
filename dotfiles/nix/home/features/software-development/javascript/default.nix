{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.software-development.javascript;

in {
        options.features.user.software-development.javascript = {
                enable = mkEnableOption "javascript";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        nodejs_24
                ];
        };
}

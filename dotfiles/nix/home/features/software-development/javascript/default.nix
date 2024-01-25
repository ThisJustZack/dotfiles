{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.software-development.javascript;

in {
        options.features.software-development.javascript = {
                enable = mkEnableOption "javascript";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        nodejs_18
                ];
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.browser.brave;

in {
        options.features.browser.brave = {
                enable = mkEnableOption "brave";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        brave
                ];
        };
}

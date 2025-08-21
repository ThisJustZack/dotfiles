{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.browser.brave;

in {
        options.features.user.browser.brave = {
                enable = mkEnableOption "brave";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        brave
                ];
        };
}

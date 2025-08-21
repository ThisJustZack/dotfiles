{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.desktop-environment.cosmic;

in {
        options.features.system.desktop-environment.cosmic = {
                enable = mkEnableOption "cosmic";
        };
        config = mkIf cfg.enable {
                services.desktopManager.cosmic.enable = true;
                services.desktopManager.cosmic.xwayland.enable = true;
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.desktop-environment.cosmic;

in {
        options.system-features.desktop-environment.cosmic = {
                enable = mkEnableOption "cosmic";
        };
        config = mkIf cfg.enable {
                services.desktopManager.cosmic.enable = true;
                services.desktopManager.cosmic.xwayland.enable = true;
        };
}

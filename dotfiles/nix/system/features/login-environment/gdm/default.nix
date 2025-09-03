{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.login-environment.gdm;

in {
        options.features.system.login-environment.gdm = {
                enable = mkEnableOption "gdm";
        };
        config = mkIf cfg.enable {
                services.xserver.gdm.enable = true;
                #services.displayManager.gdm.enable = true; # 25.11
        };
}

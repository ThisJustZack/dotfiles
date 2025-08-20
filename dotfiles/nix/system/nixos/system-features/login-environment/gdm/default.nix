{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.login-environment.gdm;

in {
        options.system-features.login-environment.gdm = {
                enable = mkEnableOption "gdm";
        };
        config = mkIf cfg.enable {
                services.displayManager.gdm.enable = true;
        };
}

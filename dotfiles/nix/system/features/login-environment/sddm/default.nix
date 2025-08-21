{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.login-environment.sddm;

in {
        options.features.system.login-environment.sddm = {
                enable = mkEnableOption "sddm";
        };
        config = mkIf cfg.enable {
                services.displayManager.sddm.enable = true;
        };
}

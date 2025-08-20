{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.login-environment.sddm;

in {
        options.system-features.login-environment.sddm = {
                enable = mkEnableOption "sddm";
        };
        config = mkIf cfg.enable {
                services.displayManager.sddm.enable = true;
        };
}

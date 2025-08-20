{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.login-environment.cosmic-greeter;

in {
        options.system-features.login-environment.cosmic-greeter = {
                enable = mkEnableOption "cosmic-greeter";
        };
        config = mkIf cfg.enable {
                services.displayManager.cosmic-greeter.enable = true;
        };
}

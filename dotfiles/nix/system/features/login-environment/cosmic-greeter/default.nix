{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.login-environment.cosmic-greeter;

in {
        options.features.system.login-environment.cosmic-greeter = {
                enable = mkEnableOption "cosmic-greeter";
        };
        config = mkIf cfg.enable {
                services.displayManager.cosmic-greeter.enable = true;
        };
}

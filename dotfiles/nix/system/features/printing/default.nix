{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.printing;

in {
        options.features.system.printing = {
                enable = mkEnableOption "printing";
        };
        config = mkIf cfg.enable {
                services.printing.enable = true;
        };
}

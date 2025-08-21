{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.printing.cups;

in {
        options.features.system.printing.cups = {
                enable = mkEnableOption "cups";
        };
        config = mkIf cfg.enable {
                services.printing.enable = true;
        };
}

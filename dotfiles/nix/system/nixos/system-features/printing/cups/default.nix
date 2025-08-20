{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.printing.cups;

in {
        options.system-features.printing.cups = {
                enable = mkEnableOption "cups";
        };
        config = mkIf cfg.enable {
                services.printing.enable = true;
        };
}

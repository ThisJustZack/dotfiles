{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.time-zone.us-east-coast;

in {
        options.features.system.time-zone.us-east-coast = {
                enable = mkEnableOption "us-east-coast";
        };
        config = mkIf cfg.enable {
                time.timeZone = "America/New_York";
        };
}

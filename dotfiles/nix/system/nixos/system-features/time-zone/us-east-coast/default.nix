{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.time-zone.us-east-coast;

in {
        options.system-features.time-zone.us-east-coast = {
                enable = mkEnableOption "us-east-coast";
        };
        config = mkIf cfg.enable {
                time.timeZone = "America/New_York";
        };
}

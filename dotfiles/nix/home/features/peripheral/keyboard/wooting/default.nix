{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.peripheral.keyboard.wooting;

in {
        options.features.user.peripheral.keyboard.wooting = {
                enable = mkEnableOption "wooting";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        wootility
                ];
        };
}

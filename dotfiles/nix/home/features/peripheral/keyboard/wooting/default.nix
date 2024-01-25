{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.peripheral.keyboard.wootility;

in {
        options.features.peripheral.keyboard.wootility = {
                enable = mkEnableOption "wootility";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        wootility
                ];
        };
}

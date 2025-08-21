{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.peripheral.keyboard.wootility;

in {
        options.features.user.peripheral.keyboard.wootility = {
                enable = mkEnableOption "wootility";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        wootility
                ];
        };
}

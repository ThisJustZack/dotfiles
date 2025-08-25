{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.peripheral.printer.epson-et8550;

in {
        options.features.user.peripheral.printer.epson-et8550 = {
                enable = mkEnableOption "epson-et8550";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        epson-escpr2
                ];
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.gaming.bottles;

in {
        options.features.user.gaming.bottles = {
                enable = mkEnableOption "bottles";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        bottles
                ];
        };
}

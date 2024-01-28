{ lib, pkgs, config, inputs, ... }: 
with lib;
let cfg = config.features.window-manager.kde-plasma;

in {
        imports = [ inputs.kde-plasma.homeManagerModules.plasma-manager ];

        options.features.window-manager.kde-plasma = {
                enable = mkEnableOption "kde-plasma";
        };
        config = mkIf cfg.enable {
                programs.plasma = {
                        enable = true;
                };
        };
}

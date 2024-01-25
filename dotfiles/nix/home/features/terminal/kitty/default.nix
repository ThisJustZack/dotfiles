{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.terminal.kitty;

in {
        options.features.terminal.kitty = {
                enable = mkEnableOption "kitty";
        };
        config = mkIf cfg.enable {
                programs.kitty = {
                        enable = true;
                        font = {
                                name = "Fira Code";
                                size = 12;
                        };
                };

                features.font.fira-code.enable = true;
        };
}

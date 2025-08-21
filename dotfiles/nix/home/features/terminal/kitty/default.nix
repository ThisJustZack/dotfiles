{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.terminal.kitty;

in {
        options.features.user.terminal.kitty = {
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

                features.user.font.fira-code.enable = true;
        };
}

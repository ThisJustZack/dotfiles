{ lib, pkgs, config, ... }:
with lib;
let cfg = config.features.user.shell.zsh;

in {
        options.features.user.shell.zsh = {
                enable = mkEnableOption "zsh";
        };
        config = mkIf cfg.enable {
                programs.zsh = {
                        enable = true;
                        autosuggestions.enable = true;
                        enableCompletion = true;
                        syntaxHighlighting.enable = true;
                };
        };
}

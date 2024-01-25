{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.shell.zsh;

in {
        options.features.shell.zsh = {
                enable = mkEnableOption "zsh";
        };
        config = mkIf cfg.enable {
                programs.zsh = {
                        enable = true;
                        enableAutosuggestions = true;
                        enableCompletion = true;
                        syntaxHighlighting.enable = true;
                };
        };
}

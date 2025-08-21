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
                        enableAutosuggestions = true;
                        enableCompletion = true;
                        syntaxHighlighting.enable = true;
                };
        };
}

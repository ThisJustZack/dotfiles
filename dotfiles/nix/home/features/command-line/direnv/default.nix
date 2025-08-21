{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.command-line.direnv;

in {
        options.features.user.command-line.direnv = {
                enable = mkEnableOption "direnv";
        };
        config = mkIf cfg.enable {
                programs.direnv = {
                        enable = true;
                        nix-direnv.enable = true;
                };
        };
}

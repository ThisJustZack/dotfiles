{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.command-line.direnv;

in {
        options.features.command-line.direnv = {
                enable = mkEnableOption "direnv";
        };
        config = mkIf cfg.enable {
                programs.direnv = {
                        enable = true;
                        nix-direnv.enable = true;
                };
        };
}

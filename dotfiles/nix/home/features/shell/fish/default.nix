{ lib, pkgs, config, ... }:
with lib;
let cfg = config.features.user.shell.fish;

in {
        options.features.user.shell.fish = {
                enable = mkEnableOption "fish";
        };
        config = mkIf cfg.enable {
                programs.fish = {
                        enable = true;
                };
        };
}

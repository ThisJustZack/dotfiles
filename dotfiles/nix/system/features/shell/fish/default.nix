{ user, lib, pkgs, config, ... }:
with lib;
let cfg = config.features.system.shell.fish;

in {
        options.features.system.shell.fish = {
                enable = mkEnableOption "fish";
        };
        config = mkIf cfg.enable {
                environment.shells = [ pkgs.fish ];
                users.users.${user}.shell = pkgs.fish;
                programs.fish.enable = true;
        };
}

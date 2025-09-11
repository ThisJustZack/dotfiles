{ user, lib, pkgs, config, ... }:
with lib;
let cfg = config.features.system.shell.zsh;

in {
        options.features.system.shell.zsh = {
                enable = mkEnableOption "zsh";
        };
        config = mkIf cfg.enable {
                environment.shells = [ pkgs.zsh ];
                users.users.${user}.shell = pkgs.zsh;
        };
}

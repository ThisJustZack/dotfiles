{ lib, pkgs, config, inputs, ... }: 
with lib;
let cfg = config.features.user.version-control.git;

in {
        options.features.user.version-control.git = {
                enable = mkEnableOption "git";
        };
        config = mkIf cfg.enable {
                programs.git = {
                    enable = true;
                    userName = "ThisJustZack";
                    userEmail = "34222941+ThisJustZack@users.noreply.github.com";
                };

                home.packages = with pkgs; [
                        gh
                        github-desktop
                ];
        };
}

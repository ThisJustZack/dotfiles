{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.software-development.typescript;

in {
        options.features.user.software-development.typescript = {
                enable = mkEnableOption "typescript";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        nodePackages.typescript-language-server
                ];
        };
}

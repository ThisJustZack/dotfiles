{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.software-development.typescript;

in {
        options.features.software-development.typescript = {
                enable = mkEnableOption "typescript";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        nodePackages.typescript-language-server
                ];
        };
}

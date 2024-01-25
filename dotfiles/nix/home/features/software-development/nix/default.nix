{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.software-development.nix;

in {
        options.features.software-development.nix = {
                enable = mkEnableOption "nix";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        rnix-lsp
                ];
        };
}

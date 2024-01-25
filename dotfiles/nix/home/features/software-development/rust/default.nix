{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.software-development.rust;

in {
        options.features.software-development.rust = {
                enable = mkEnableOption "rust";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        rustc
                        cargo
                        rust-analyzer
                ];
        };
}

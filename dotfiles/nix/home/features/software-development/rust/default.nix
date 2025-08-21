{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.software-development.rust;

in {
        options.features.user.software-development.rust = {
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

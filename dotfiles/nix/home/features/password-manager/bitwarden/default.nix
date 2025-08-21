{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.password-manager.bitwarden;

in {
        options.features.user.password-manager.bitwarden = {
                enable = mkEnableOption "bitwarden";
        };
        config = mkIf cfg.enable {
                home.packages = with pkgs; [
                        bitwarden
                ];
        };
}

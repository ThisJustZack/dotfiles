{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.audio;

in {
        options.features.system.audio = {
                enable = mkEnableOption "audio";
        };
        config = mkIf cfg.enable {
                security.rtkit.enable = true;
                services.pipewire = {
                        enable = true;
                        alsa.enable = true;
                        alsa.support32Bit = true;
                        pulse.enable = true;
                };
        };
}

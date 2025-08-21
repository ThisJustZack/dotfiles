{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.system.audio.pipewire;

in {
        options.features.system.audio.pipewire = {
                enable = mkEnableOption "pipewire";
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

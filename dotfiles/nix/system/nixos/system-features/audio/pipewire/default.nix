{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.system-features.audio.pipewire;

in {
        options.system-features.audio.pipewire = {
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

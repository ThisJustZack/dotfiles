{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.functions.system.hasVirtualizationCapability;

in {
        options.functions.system.hasVirtualizationCapability = {
                enable = mkEnableOption "hasVirtualizationCapability";
        };
        config = mkIf cfg.enable {
                boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
                virtualisation = {
                        libvirtd.enable = true;
                        docker = {
                                enable = true;
                                rootless = {
                                        enable = true;
                                        setSocketVariable = true;
                                };
                        };
                        waydroid.enable = true;
                };
        };
}

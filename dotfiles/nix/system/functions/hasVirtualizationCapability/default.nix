{ user, lib, pkgs, config, ... }: 
with lib;
let cfg = config.functions.system.hasVirtualizationCapability;

in {
        options.functions.system.hasVirtualizationCapability = {
                enable = mkEnableOption "hasVirtualizationCapability";
        };
        config = mkIf cfg.enable {
                boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
                users.extraGroups.docker.members = [ user ];
                virtualisation = {
                        libvirtd.enable = true;
                        docker = {
                                enable = false;
                                rootless = {
                                        enable = true;
                                        setSocketVariable = true;
                                };
                        };
                        waydroid.enable = true;
                };
        };
}

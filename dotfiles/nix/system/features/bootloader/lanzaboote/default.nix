{ lib, pkgs, config, inputs, ... }: 
with lib;
let cfg = config.features.system.bootloader.lanzaboote;

in {
        imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

        options.features.system.bootloader.lanzaboote = {
                enable = mkEnableOption "lanzaboote";
        };
        config = mkIf cfg.enable {
                boot = {
                        lanzaboote = {
                                enable = true;
                                pkiBundle = "/var/lib/sbctl";
                                
                                autoGenerateKeys.enable = true;
                                autoEnrollKeys = {
                                        enable = true;
                                        autoReboot = true;
                                };
                        };

                        loader.systemd-boot.enable = mkForce false;
                };

                environment.systemPackages = [ pkgs.sbctl ];
        };
}

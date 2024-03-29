{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.application-linking.mac;

in {
        disabledModules = [ "targets/darwin/linkapps.nix" ];
        
        options.features.application-linking.mac = {
                enable = mkEnableOption "mac";
        };
        config = mkIf cfg.enable {
                home.activation = lib.mkIf pkgs.stdenv.isDarwin {
                        copyApplications =
                        let
                                apps = pkgs.buildEnv {
                                name = "home-manager-applications";
                                paths = config.home.packages;
                                pathsToLink = "/Applications";
                                };
                        in
                        lib.hm.dag.entryAfter [ "writeBoundary" ] ''
                                baseDir="$HOME/Applications/Home Manager Apps"
                                if [ -d "$baseDir" ]; then
                                rm -rf "$baseDir"
                                fi
                                mkdir -p "$baseDir"
                                for appFile in ${apps}/Applications/*; do
                                target="$baseDir/$(basename "$appFile")"
                                $DRY_RUN_CMD cp ''${VERBOSE_ARG:+-v} -fHRL "$appFile" "$baseDir"
                                $DRY_RUN_CMD chmod ''${VERBOSE_ARG:+-v} -R +w "$target"
                                done
                        '';
                };
        };
}

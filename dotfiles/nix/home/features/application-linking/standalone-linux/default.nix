{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.application-linking.standalone-linux;

in {
        options.features.user.application-linking.standalone-linux = {
                enable = mkEnableOption "standalone-linux";
        };
        config = mkIf cfg.enable {
                home.activation = {
                        linkDesktopApplications = {
                                after = [ "writeBoundary" "createXdgUserDirectories" ];
                                before = [ ];
                                data = ''
                                        rm -rf ${config.xdg.dataHome}/applications/home-manager
                                        mkdir -p ${config.xdg.dataHome}/applications/home-manager
                                        ln -sf ${config.home.homeDirectory}/.nix-profile/share/applications/* ${config.xdg.dataHome}/applications/home-manager/
                                '';
                        };
                };
        };
}

{ inputs, outputs, lib, config, pkgs, ... }: {
        home = {
                username = "zack";
                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.home.username}" else "/home/${config.home.username}";
        };

        disabledModules = [ "targets/darwin/linkapps.nix" ];
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

        imports = [
                ../../features/lsp
                ../../features/nvim
                ../../features/font
                ../../features/kitty
                ../../features/zsh
                ../../../system/home-manager
        ];
}

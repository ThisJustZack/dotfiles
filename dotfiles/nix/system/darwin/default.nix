{ inputs, outputs, lib, config, pkgs, ... }: {
        services.nix-daemon.enable = true;

        networking = {
                hostName = "macbook";
        };

        security = {
                pam.enableSudoTouchIdAuth = true;
        };

        system = {
                stateVersion = 4;

                defaults = {
                        NSGlobalDomain = {
                                "com.apple.mouse.tapBehavior" = 1;
                        };
                        dock = {
                                autohide = true;
                                orientation = "bottom";
                                show-recents = false;
                                tilesize = 48;
                        };
                        trackpad = {
                                Clicking = true;
                        };
                        menuExtraClock = {
                                Show24Hour = true;
                        };
                };
        };
}

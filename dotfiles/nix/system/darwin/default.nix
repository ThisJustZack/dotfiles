{ inputs, outputs, lib, config, pkgs, ... }: {
        services.nix-daemon.enable = true;

        networking = {
                computerName = "macbook";
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

        homebrew.enable = true;
        homebrew.onActivation = {
                autoUpdate = true;
                cleanup = "zap";
                upgrade = true;
        };
}

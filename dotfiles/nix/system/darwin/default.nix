{ inputs, outputs, lib, config, pkgs, ... }: {
        networking = {
                computerName = "macbook";
        };

        system = {
                stateVersion = 4;

                defaults = {
                        dock = {
                                autohide = true;
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

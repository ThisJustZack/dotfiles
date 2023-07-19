{ inputs, outputs, lib, config, pkgs, ... }: {
        homebrew.enable = true;
        homebrew.onActivation = {
                autoUpdate = true;
                cleanup = "zap";
                upgrade = true;
        };

        environment.systemPath = [ config.homebrew.brewPrefix = "/opt/local/bin" ];
        
        homebrew.brews = import ./formulae { };
        homebrew.casks = import ./casks { };
}

{ inputs, outputs, lib, config, pkgs, ... }: {
        homebrew.enable = true;
        homebrew.onActivation = {
                autoUpdate = true;
                cleanup = "zap";
                upgrade = true;
        };
        
        homebrew.brews = import ./formulae { };
        homebrew.casks = import ./casks { };
}

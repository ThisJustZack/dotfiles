{ inputs, outputs, lib, config, pkgs, ... }: {
        programs.direnv = {
                enable = true;
                nix-direnv.enable = true;
        };
}

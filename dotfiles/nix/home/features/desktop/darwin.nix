{ inputs, outputs, lib, config, pkgs, ... }: {
        homebrew.casks = [
                bitwarden
                discord
                protonvpn
                spotify
        ];
}
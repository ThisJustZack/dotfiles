{ lib, pkgs, config, ... }: {
        imports = [
                ./application-linking/mac
                ./application-linking/standalone-linux
                ./browser/brave
                ./browser/firefox
                ./command-line/direnv
                ./command-line/starship
                ./communication-service/discord
                ./editor/godot
                ./editor/obsidian
                ./font/fira-code
                ./gaming/bottles
                ./gaming/gamemode
                ./gaming/lutris
                ./gaming/mangohud
                ./gaming/protonup
                ./gaming/steam
                ./password-manager/bitwarden
                ./peripheral/keyboard/wooting
                ./peripheral/tablet/opendriver
                ./shell/zsh
                ./software-development/javascript
                ./software-development/nix
                ./software-development/rust
                ./software-development/typescript
                ./streaming-service/spotify
                ./terminal/kitty
                ./vpn/proton
                ./window-manager/hyprland
                ./window-manager/mutter
        ];
}
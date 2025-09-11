{ user, pkgs, config, osConfig ? {}, lib ? pkgs.lib, ... }:
with lib;
let
        isGamingMachine =
                hasAttrByPath [ "functions" "system" "isGamingMachine" "enable" ] osConfig
                && (osConfig.functions.system.isGamingMachine.enable or false);
in {
        imports = [
                ../../../system/os/home-manager
                ../../features
        ];

        config = mkMerge [
                {
                        home = {
                                username = user;
                                homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${user}" else "/home/${user}";
                        };

                        features.user.terminal.kitty.enable = true;
                        features.user.shell.zsh.enable = true;
                        features.user.command-line.starship.enable = true;
                        features.user.software-development.javascript.enable = true;
                        features.user.software-development.rust.enable = true;
                        features.user.software-development.typescript.enable = true;
                        features.user.editor.nvim.enable = true;
                        features.user.editor.vs-code.enable = true;
                        features.user.version-control.git.enable = true;
                        features.user.password-manager.bitwarden.enable = true;
                        features.user.streaming-service.spotify.enable = true;
                        features.user.peripheral.keyboard.wooting.enable = true;
                        features.user.peripheral.printer.epson-et8550.enable = true;
                        features.user.communication-service.discord.enable = true;
                        features.user.browser.brave.enable = true;
                        features.user.browser.firefox.enable = true;
                        features.user.vpn.proton.enable = true;
                }
                (mkIf isGamingMachine {
                        features.user.gaming.bottles.enable = true;
                        features.user.gaming.gamemode.enable = true;
                        features.user.gaming.lutris.enable = true;
                        features.user.gaming.mangohud.enable = true;
                        features.user.gaming.protonup.enable = true;
                        home.packages = with pkgs; [
                                optcg-sim
                        ];
                })
        ];
}

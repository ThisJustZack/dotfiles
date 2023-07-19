{ inputs, outputs, lib, config, pkgs, ... }: {
        services.skhd = {
                enable = true;
                skhdConfig = ''
                        cmd + shift - 1 : yabai -m space --focus 1
                        cmd + shift - 2 : yabai -m space --focus 2
                        cmd + shift - 3 : yabai -m space --focus 3
                        cmd + shift - 4 : yabai -m space --focus 4
                        cmd + shift - 5 : yabai -m space --focus 5

                        ctrl - space : yabai -m window --toggle float
                '';
        };
}

{ inputs, outputs, lib, config, pkgs, ... }: {
        services.yabai = {
                enable = true;
                enableScriptingAddition = true;
                config = {
                        focus_follows_mouse = "autoraise";
                        mouse_follows_focus = "off";

                        window_placement = "second_child";
                        window_opacity = "off";
                        auto_balance = "on";
                        top_padding = 10;
                        bottom_padding = 10;
                        left_padding = 10;
                        right_padding = 10;
                        window_gap = 10;
                        layout = "bsp";

                        mouse_modifier = "fn";
                        mouse_action1 = "move";
                        mouse_action2 = "resize";
                };
                extraConfig = ''
                        sudo yabai --load-sa
                        yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

                        yabai -m space 1 --label misc
                        yabai -m space 2 --label terminal
                        yabai -m space 3 --label web
                        yabai -m space 4 --label chat
                        yabai -m space 5 --label music

                        yabai -m rule --add app="^Safari$" space=web
                        yabai -m rule --add app="^Discord$" space=chat
                        yabai -m rule --add app="^Spotify$" space=music
                        yabai -m rule --add app="^kitty$" space=terminal

                        yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect))|Move|Info|Pref)" manage=off
                        yabai -m rule --add label="System Preferences" app="^System Preferences$" title=".*" manage=off
                        yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
                        yabai -m rule --add label="Software Update" app="^Software Update$" manage=off
                        yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
                '';
        };
}

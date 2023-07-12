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
                        yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect))|Move|Info|Pref)" manage=off
                        yabai -m rule --add label="System Preferences" app="^System Preferences$" title=".*" manage=off
                        yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
                        yabai -m rule --add label="Software Update" app="^Software Update$" manage=off
                        yabai -m rule --add label="About This Mac" app="System Information" title="About This Mac" manage=off
                '';
        };
}

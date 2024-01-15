{ pkgs, ... }: {
        programs.starship = {
                enable = true;
                settings = {
                        add_newline = false;
                        line_break.disabled = false;

                        git_commit = {
                                commit_hash_length = 5;
                        };

                        character = {
                                success_symbol = "[➜](bold green)";
                                error_symbol = "[➜](bold red)";
                        };

                        username = {
                                show_always = true;
                                style_user = "bold bg:none fg:#7aa2f7";
                                format = "[$user]($style)";
                        };

                        hostname = {
                                ssh_only = false;
                                style = "bold bg:none fg:#CDD6F4";
                                format = "@[$hostname]($style) ";
                                disabled = false;
                        };

                        directory = {     
                                read_only = " ";
                                truncation_length = 3;
                                truncation_symbol = "./";
                                style = "bold bg:none fg:#7aa2f7";
                        };

                        rust.symbol = "[ ](red) ";
                        nodejs = {
                                version_format = "v$raw(blue)";
                                symbol = "🤖";
                                format = "via [$symbol ($version)]($style) ";
                        };
                        package = {
                                symbol = "📦";
                                format = "via [$symbol ($version)]($style) ";
                        };
                };
        };
}

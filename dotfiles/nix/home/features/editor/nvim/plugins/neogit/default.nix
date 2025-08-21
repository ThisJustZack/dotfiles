{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.neogit;

in {
        options.features.user.editor.nvim.plugins.neogit = {
                enable = mkEnableOption "neogit";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = neogit;
                                        type = "lua";
                                        config = ''
                                                require('neogit').setup {
                                                }
                                        '';
                                }
                        ];
                };
        };
}

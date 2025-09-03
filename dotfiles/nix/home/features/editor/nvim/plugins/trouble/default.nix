{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.trouble;

in {
        options.features.user.editor.nvim.plugins.trouble = {
                enable = mkEnableOption "trouble";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = trouble-nvim;
                                        type = "lua";
                                        config = ''
                                                require('trouble').setup {
                                                        opts = {
                                                                modes = {
                                                                        auto_open = true,
                                                                        auto_close = true,
                                                                }
                                                        }
                                                }
                                        '';
                                }
                        ];
                };
        };
}

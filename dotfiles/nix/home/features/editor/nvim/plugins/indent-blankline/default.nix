{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.nvim.plugins.indent-blankline;

in {
        options.features.editor.nvim.plugins.indent-blankline = {
                enable = mkEnableOption "indent-blankline";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = indent-blankline-nvim;
                                        type = "lua";
                                        config = ''
                                                vim.opt.list = true
                                                vim.opt.listchars:append 'space:·'

                                                require('ibl').setup {
                                                }
                                        '';
                                }
                        ];
                };
        };
}

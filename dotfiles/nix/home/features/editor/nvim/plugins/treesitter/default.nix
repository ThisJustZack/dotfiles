{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.treesitter;

in {
        options.features.user.editor.nvim.plugins.treesitter = {
                enable = mkEnableOption "treesitter";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = nvim-treesitter;
                                        type = "lua";
                                        config = ''
                                                require('nvim-treesitter.configs').setup {
                                                        highlight = {
                                                                enable = true,
                                                        }
                                                }
                                        '';
                                }
                        ];
                };
        };
}

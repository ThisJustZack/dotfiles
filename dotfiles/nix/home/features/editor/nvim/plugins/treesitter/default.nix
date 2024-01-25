{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.nvim.plugins.treesitter;

in {
        options.features.editor.nvim.plugins.treesitter = {
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

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.nvim.plugins.lualine;

in {
        options.features.editor.nvim.plugins.lualine = {
                enable = mkEnableOption "lualine";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = lualine-nvim;
                                        type = "lua";
                                        config = ''
                                                require('lualine').setup {
                                                }
                                        '';
                                }
                        ];
                };
        };
}

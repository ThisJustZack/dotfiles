{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.surround;

in {
        options.features.user.editor.nvim.plugins.surround = {
                enable = mkEnableOption "surround";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = nvim-surround;
                                        type = "lua";
                                        config = ''
                                                require('nvim-surround').setup {
                                        }
                                        '';
                                }
                        ];
                };
        };
}

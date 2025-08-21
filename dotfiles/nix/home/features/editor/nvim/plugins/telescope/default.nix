{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.telescope;

in {
        options.features.user.editor.nvim.plugins.telescope = {
                enable = mkEnableOption "telescope";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = telescope-nvim;
                                        type = "lua";
                                        config = ''
                                                require('telescope').setup()
                                        '';
                                }
                        ];
                };
        };
}

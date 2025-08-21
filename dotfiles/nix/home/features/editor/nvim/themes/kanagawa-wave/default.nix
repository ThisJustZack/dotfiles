{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.themes.kanagawa-wave;

in {
        options.features.user.editor.nvim.themes.kanagawa-wave = {
                enable = mkEnableOption "kanagawa-wave";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = kanagawa-nvim;
                                        type = "lua";
                                        config = ''
                                                require('kanagawa').load('wave')
                                        '';
                                }
                        ];
                };
        };
}

{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.comment;

in {
        options.features.user.editor.nvim.plugins.comment = {
                enable = mkEnableOption "comment";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = comment-nvim;
                                        type = "lua";
                                        config = ''
                                                require('Comment').setup()
                                        '';
                                }
                        ];
                };
        };
}

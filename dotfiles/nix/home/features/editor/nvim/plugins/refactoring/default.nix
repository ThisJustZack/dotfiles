{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.refactoring;

in {
        options.features.user.editor.nvim.plugins.refactoring = {
                enable = mkEnableOption "refactoring";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = refactoring-nvim;
                                        type = "lua";
                                        config = ''
                                        require('refactoring').setup {
                                        }
                                        '';
                                }
                        ];
                };
        };
}

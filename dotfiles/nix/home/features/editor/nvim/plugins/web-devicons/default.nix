{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.web-devicons;

in {
        options.features.user.editor.nvim.plugins.web-devicons = {
                enable = mkEnableOption "web-devicons";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = nvim-web-devicons;
                                        type = "lua";
                                        config = ''
                                                require('nvim-web-devicons').setup {
                                                }
                                        '';
                                }
                        ];
                };
        };
}

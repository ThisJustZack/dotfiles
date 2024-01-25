{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.nvim.plugins.web-devicons;

in {
        options.features.editor.nvim.plugins.web-devicons = {
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

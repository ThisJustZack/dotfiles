{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.nvim.plugins.plenary;

in {
        options.features.editor.nvim.plugins.plenary = {
                enable = mkEnableOption "plenary";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                plenary-nvim
                        ];
                };
        };
}

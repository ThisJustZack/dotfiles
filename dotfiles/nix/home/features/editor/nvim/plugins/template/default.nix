{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.nvim.plugins.template;

in {
        options.features.editor.nvim.plugins.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                        ];
                };
        };
}

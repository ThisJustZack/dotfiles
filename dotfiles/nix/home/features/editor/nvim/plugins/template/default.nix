{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.template;

in {
        options.features.user.editor.nvim.plugins.template = {
                enable = mkEnableOption "template";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                        ];
                };
        };
}

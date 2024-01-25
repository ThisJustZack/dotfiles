{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.editor.nvim.plugins.copilot;

in {
        options.features.editor.nvim.plugins.copilot = {
                enable = mkEnableOption "copilot";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                copilot-vim
                        ];
                };
        };
}

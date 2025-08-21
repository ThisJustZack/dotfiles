{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.copilot;

in {
        options.features.user.editor.nvim.plugins.copilot = {
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

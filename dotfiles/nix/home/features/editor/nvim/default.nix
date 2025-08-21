{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim;

in {
        imports = [ ./plugins ./themes ];

        options.features.user.editor.nvim = {
                enable = mkEnableOption "nvim";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        enable = true;

                        defaultEditor = true;
                        viAlias = true;
                        vimAlias = true;

                        extraLuaConfig = ''
                                local set = vim.opt
                                local TAB_WIDTH = 8

                                set.number = true
                                set.cursorline = true
                                set.tabstop = TAB_WIDTH
                                set.shiftwidth = TAB_WIDTH
                                set.softtabstop = TAB_WIDTH
                                set.expandtab = true
                                set.smarttab = true
                        '';
                };

                features.user.editor.nvim.plugins.plenary.enable = true;
                features.user.editor.nvim.plugins.telescope.enable = true;
                features.user.editor.nvim.plugins.web-devicons.enable = true;
                features.user.editor.nvim.plugins.treesitter.enable = true;
                features.user.editor.nvim.plugins.indent-blankline.enable = true;
                features.user.editor.nvim.plugins.lualine.enable = true;
                features.user.editor.nvim.plugins.neogit.enable = true;
                features.user.editor.nvim.plugins.trouble.enable = true;
                features.user.editor.nvim.plugins.lspconfig.enable = true;
                features.user.editor.nvim.plugins.copilot.enable = true;
                features.user.editor.nvim.plugins.refactoring.enable = true;
                features.user.editor.nvim.plugins.comment.enable = true;
                features.user.editor.nvim.plugins.surround.enable = true;
                features.user.editor.nvim.themes.kanagawa-wave.enable = true;
        };
}

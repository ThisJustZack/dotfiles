{ lib, pkgs, config, ... }: 
with lib;
let cfg = config.features.user.editor.nvim.plugins.lspconfig;

in {
        options.features.user.editor.nvim.plugins.lspconfig = {
                enable = mkEnableOption "lspconfig";
        };
        config = mkIf cfg.enable {
                programs.neovim = {
                        plugins = with pkgs.vimPlugins; [
                                {
                                        plugin = nvim-lspconfig;
                                        type = "lua";
                                        config = ''
                                                local lspconfig = require('lspconfig')
                                                local lspdefault = lspconfig.util.default_config

                                                lspdefault.capabilities = vim.tbl_deep_extend(
                                                        'force',
                                                        lspdefault.capabilities,
                                                        require('cmp_nvim_lsp').default_capabilities()
                                                )
                                        '' +
                                        optionalString config.features.user.software-development.nix.enable ''
                                                lspconfig.rnix.setup {
                                                }
                                        '' +
                                        optionalString config.features.user.software-development.rust.enable ''
                                                lspconfig.rust_analyzer.setup {
                                                }
                                        '' +
                                        optionalString config.features.user.software-development.typescript.enable ''
                                                lspconfig.tsserver.setup {
                                                        cmd = { "typescript-language-server", "--stdio", "--tsserver-path=tsserver" }
                                                }
                                        '';
                                }
                                nvim-snippy
                                cmp-snippy
                                cmp-buffer
                                cmp-nvim-lsp
                                {
                                        plugin = nvim-cmp;
                                        type = "lua";
                                        config = ''
                                                vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

                                                local cmp = require('cmp')

                                                local select_opts = { behavior = cmp.SelectBehavior.Select }

                                                cmp.setup {
                                                        snippet = {
                                                                expand = function(args)
                                                                        require('snippy').expand_snippet(args.body)
                                                                end,
                                                        },
                                                        sources = {
                                                                { name = 'nvim_lsp' },
                                                                { name = 'snippy' },
                                                                { name = 'buffer' },
                                                        },
                                                        window = {
                                                                completion = cmp.config.window.bordered(),
                                                                documentation = cmp.config.window.bordered(),
                                                        },
                                                        mapping = cmp.mapping.preset.insert {
                                                                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                                                                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                                                                ['<C-Space>'] = cmp.mapping.complete(),
                                                                ['<C-e>'] = cmp.mapping.abort(),
                                                                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                                                        },
                                                }
                                        '';
                                }
                        ];
                };
        };
}

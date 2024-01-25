{ inputs, outputs, lib, config, pkgs, ... }: {
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

                plugins = with pkgs.vimPlugins; [

                        # Core Dependency
                        plenary-nvim

                        # Core Functionality
                        {
                                plugin = telescope-nvim;
                                type = "lua";
                                config = ''
                                        require('telescope').setup()
                                '';
                        }

                        # Stylizing
                        {
                                plugin = kanagawa-nvim;
                                type = "lua";
                                config = ''
                                        require('kanagawa').load('wave')
                                '';
                        }
                        {
                                plugin = nvim-web-devicons;
                                type = "lua";
                                config = ''
                                        require('nvim-web-devicons').setup {
                                        }
                                '';
                        }
                        {
                                plugin = nvim-treesitter;
                                type = "lua";
                                config = ''
                                        require('nvim-treesitter.configs').setup {
                                                highlight = {
                                                        enable = true,
                                                }
                                        }
                                '';
                        }
                        {
                                plugin = indent-blankline-nvim;
                                type = "lua";
                                config = ''
                                        vim.opt.list = true
                                        vim.opt.listchars:append 'space:·'

                                        require('ibl').setup {
                                        }
                                '';
                        }
                        {
                                plugin = lualine-nvim;
                                type = "lua";
                                config = ''
                                        require('lualine').setup {
                                        }
                                '';
                        }

                        # IDE Integrations
                        {
                                plugin = neogit;
                                type = "lua";
                                config = ''
                                        require('neogit').setup {
                                        }
                                '';
                        }
                        {
                                plugin = trouble-nvim;
                                type = "lua";
                                config = ''
                                        require('trouble').setup {
                                                auto_open = true,
                                                auto_close = true,
                                        }
                                '';
                        }
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

                                        lspconfig.rnix.setup {
                                        }
                                        lspconfig.rust_analyzer.setup {
                                        }
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

                        # Development Assistance
                        copilot-vim
                        {
                                plugin = refactoring-nvim;
                                type = "lua";
                                config = ''
                                require('refactoring').setup {
                                }
                                '';
                        }
                        {
                                plugin = comment-nvim;
                                type = "lua";
                                config = ''
                                        require('Comment').setup()
                                '';
                        }
                        {
                                plugin = nvim-surround;
                                type = "lua";
                                config = ''
                                        require('nvim-surround').setup {
                                }
                                '';
                        }
                ];
        };
}

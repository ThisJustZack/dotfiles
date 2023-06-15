{ inputs, outputs, lib, config, pkgs, ... }:

{
  imports = [
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "zack-wsl";
    homeDirectory = "/home/zack-wsl";
  };

  home.packages = with pkgs; [
    rnix-lsp
    rust-analyzer
    nodePackages.typescript-language-server
  ];

  programs.neovim = {
    enable = true;

    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
      set number
      set cursorline
      set tabstop=8
      set shiftwidth=8
      set softtabstop=0
      set expandtab
      set smarttab
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

          require('indent_blankline').setup {
            show_current_context = true,
            show_current_context_start = true,
            space_char_blankline = ' ',
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

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}

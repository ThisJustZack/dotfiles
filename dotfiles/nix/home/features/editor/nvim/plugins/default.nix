{ lib, pkgs, config, ... }: {
        imports = [
                ./comment
                ./copilot
                ./indent-blankline
                ./lspconfig
                ./lualine
                ./neogit
                ./plenary
                ./refactoring
                ./surround
                ./telescope
                ./treesitter
                ./trouble
                ./web-devicons
        ];
}
{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;    

    plugins = with pkgs.vimPlugins; [
      plenary-nvim
      telescope-nvim
      nvim-treesitter
      nvim-treesitter-context
      copilot-vim
      refactoring-nvim
      trouble-nvim
      vim-fugitive
      leap-nvim
      indent-blankline-nvim
      comment-nvim
      bufferline-nvim
      vim-lastplace
      vim-airline
      nvim-surround
    ];
  };
}

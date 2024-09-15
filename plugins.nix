{ pkgs }:
with pkgs.vimPlugins; [
  telescope-nvim
  telescope-recent-files
  nvim-lspconfig
  ultisnips
  kanagawa-nvim
  nvim-treesitter.withAllGrammars
  nvim-treesitter-textobjects
  which-key-nvim
  nvim-grey
]

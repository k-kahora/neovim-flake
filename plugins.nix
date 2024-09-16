{ pkgs }:
with pkgs.vimPlugins; [
  # telescopej
  telescope-nvim
  telescope-recent-files # Built from src
  # lsp
  nvim-lspconfig
  lsp-status-nvim
  lspkind-nvim # pretty icons
  # snippets
  ultisnips
  luasnip
  cmp_luasnip
  # completions
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-cmdline
  cmp-nvim-ultisnips
  cmp-emoji
  # treesitter
  nvim-treesitter.withAllGrammars
  nvim-treesitter-textobjects
  # which key
  which-key-nvim
  # themes
  tokyonight-nvim
  onedarkpro-nvim
  nvim-grey # Built from src
  kanagawa-nvim
  # commenting
  vim-commentary
]

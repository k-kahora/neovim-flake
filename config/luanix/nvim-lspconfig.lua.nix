# vim: ft=lua
{ pkgs }:
''
local nvim_lsp = require("lspconfig")

nvim_lsp.emmet_language_server.setup({
  init_options = {
    emmet_language_server = {
      path = "${pkgs.emmet-language-server}/bin/emmet-language-server",
    },
  },
})
nvim_lsp.css.setup({
  init_options = {
    css = {
      path = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-css-language-server",
    },
  },
})
nvim_lsp.html.setup({
  init_options = {
    html = {
      path = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-html-language-server",
    },
  },
})
nvim_lsp.clangd.setup({
  init_options = {
    clangd = {
      path = "${pkgs.clang-tools}/bin/clangd",
    },
  },
})
nvim_lsp.ts_ls.setup({
  init_options = {
    ts_ls = {
      path = "${pkgs.nodePackages.typescript}/lib/node_modules/typescript/lib",
    },
  },
})
''

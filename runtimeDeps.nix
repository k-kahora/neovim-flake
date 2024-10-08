{ pkgs }:
with pkgs; [
  lazygit
  # packages with results in /lib/node_modules/.bin must come at the end
  clang-tools
  emmet-language-server
  pyright
  nodePackages.vscode-langservers-extracted
  nodePackages.typescript
  nodePackages.typescript-language-server
  ocamlPackages.ocaml-lsp
  ocamlPackages.ocamlformat
]

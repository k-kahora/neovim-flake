# vim: ft=lua
{ pkgs }:
''
local capabilities = {}
local nvim_lsp = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_extend('keep', capabilities, cmp_nvim_lsp.default_capabilities())


local lsp_status = require('lsp-status')
lsp_status.register_progress()
lsp_status.config {
  status_symbol = "",
  indicator_separator = "",
  component_separator = "",
  show_filename = false,
  diagnostics = false,
  current_function = false,
}
capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)

nvim_lsp.emmet_language_server.setup({
  init_options = {
    emmet_language_server = {
      path = "${pkgs.emmet-language-server}/bin/emmet-language-server",
    },
  },
})
nvim_lsp.ocamllsp.setup({
  init_options = {
    ocamllsp = {
      path = "${pkgs.ocamlPackages.ocaml-lsp}/bin/ocamllsp",
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

local servers = {
  {
    name = "ocamllsp",
  },
}

for _, server in pairs(servers) do
    local setup = {
      debug=true,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 3000, --150
      },
      on_attach = function(client, bufnr)
        --vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        -- vim.keymap.set("n", ",ar", vim.lsp.buf.rename, bufopts)
        -- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
        -- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)

        lsp_status.on_attach(client)

        if server.on_attach then
          server.on_attach(client, bufnr)
        end
      end,
    }

    if server.setup then
      for k, v in pairs(server.setup) do
        setup[k] = v
      end
    end

    nvim_lsp[server.name].setup(setup)
  end

''

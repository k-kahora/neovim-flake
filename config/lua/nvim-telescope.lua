local opt = { noremap = true }
local telescope = require("telescope")
telescope.setup({})
telescope.load_extension("recent_files")
vim.api.nvim_set_keymap("n", "<leader><tab>", ":lua require('telescope.builtin').find_files()<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader><leader>", ":lua require('telescope').extensions.recent_files.pick()<CR>", opt)

require("nvim-treesitter.configs").setup({
	auto_install = false, -- Parsers are managed by Nix
	indent = {
		enable = true,
		disable = { "python", "yaml" }, -- Yaml and Python indents are unusable
	},
	highlight = {
		enable = true,
		disable = { "yaml" }, -- Disable yaml highlighting because Helm sucks :<
		additional_vim_regex_highlighting = false,
	},
})
return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	lazy = false,
	opts = {
		prompt_func_return_type = {
			go = false,
			python = false,
			-- Rust not officially supported; we disable prompts
			rust = false,
		},
		prompt_func_param_type = {
			go = false,
			python = false,
			rust = false,
		},
		printf_statements = {},
		print_var_statements = {},
		show_success_message = false,
	},
	config = function(_, opts)
		require("refactoring").setup(opts)

		local map = vim.api.nvim_set_keymap
		local opts_n = { noremap = true, silent = true }

		-- Extract Function (visual mode)
		map("x", "<leader>fe", ":Refactor extract<CR>", opts_n)
		-- Extract Function to File
		map("x", "<leader>ff", ":Refactor extract_to_file<CR>", opts_n)
		-- Extract Variable (visual mode)
		map("x", "<leader>fv", ":Refactor extract_var<CR>", opts_n)
		-- Inline Variable (normal + visual)
		map("n", "<leader>fi", ":Refactor inline_var<CR>", opts_n)
		map("x", "<leader>fi", ":Refactor inline_var<CR>", opts_n)
		-- Inline Function (normal mode)
		map("n", "<leader>fI", ":Refactor inline_func<CR>", opts_n)
		-- Extract Block (normal mode)
		map("n", "<leader>fb", ":Refactor extract_block<CR>", opts_n)
		map("n", "<leader>fbf", ":Refactor extract_block_to_file<CR>", opts_n)
		-- Generic refactor command (normal & visual)
		map("n", "<leader>fn", ":Refactor<Space>", opts_n)
		map("x", "<leader>fn", ":Refactor<Space>", opts_n)
	end,
}

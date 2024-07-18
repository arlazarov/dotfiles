return {
	"folke/trouble.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		require("trouble").setup({
			modes = {
				mydiags = {
					mode = "diagnostics", -- inherit from diagnostics mode
					filter = {
						any = {
							buf = 0, -- current buffer
							{
								severity = vim.diagnostic.severity.ERROR, -- errors only
								-- limit to files in the current project
								function(item)
									return item.filename:find(
										(vim.loop or vim.uv).cwd(),
										1,
										true
									)
								end,
							},
						},
					},
				},
			},
		})
		-- Register key mappings
		require("which-key").add({
			{ "<leader>x", group = "Trouble" },
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<CR>",
				desc = "Trouble: toggle",
			},
			{
				"<leader>xq",
				"<cmd>Trouble qflist toggle<CR>",
				desc = "Trouble: quickfix list",
			},
			{
				"<leader>xl",
				"<cmd>Trouble loclist toggle<CR>",
				desc = "Trouble: location list",
			},
			{
				"gR",
				"<cmd>Trouble lsp_references<CR>",
				desc = "LSP References (Trouble)",
			},
		})
	end,
}

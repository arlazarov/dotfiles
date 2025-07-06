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
		vim.keymap.set("n", "<leader>x", "<nop>", { desc = "Trouble" })

		vim.keymap.set(
			"n",
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle<CR>",
			{ desc = "Trouble: toggle" }
		)
		vim.keymap.set(
			"n",
			"<leader>xq",
			"<cmd>Trouble qflist toggle<CR>",
			{ desc = "Trouble: quickfix list" }
		)
		vim.keymap.set(
			"n",
			"<leader>xl",
			"<cmd>Trouble loclist toggle<CR>",
			{ desc = "Trouble: location list" }
		)
		vim.keymap.set(
			"n",
			"gR",
			"<cmd>Trouble lsp_references<CR>",
			{ desc = "LSP References (Trouble)" }
		)
	end,
}

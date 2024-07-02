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
									return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
								end,
							},
						},
					},
				},
			},
		})
		local wk = require("which-key")

		-- Register key mappings
		wk.register({
			x = {
				name = "Trouble",
				x = { "<cmd>Trouble diagnostics toggle<CR>", "Trouble: toggle" },
				q = { "<cmd>Trouble qflist toggle<CR>", "Trouble: quickfix list" },
				l = { "<cmd>Trouble loclist toggle<CR>", "Trouble: location list" },
			},
		}, { prefix = "<leader>" })

		wk.register({
			gR = { "<cmd>Trouble lsp_references<CR>", "LSP References (Trouble)" },
		})
	end,
}

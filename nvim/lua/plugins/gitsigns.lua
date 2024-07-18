return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	dependencies = "folke/which-key.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local wk = require("which-key")
			wk.add({
				{ "<leader>g", group = "Git" },
				{ "<leader>g]", gs.next_hunk, desc = "Git: next hunk" },
				{ "<leader>g[", gs.prev_hunk, desc = "Git: prev hunk" },
				{ "<leader>gs", gs.stage_hunk, desc = "Git: stage hunk" },
				{ "<leader>gr", gs.prev_hunk, desc = "Git: prev hunk" },
				{ "<leader>gS", gs.stage_buffer, desc = "Git: stage buffer" },
				{ "<leader>gR", gs.reset_buffer, desc = "Git: reset buffer" },
				{
					"<leader>gu",
					gs.undo_stage_hunk,
					desc = "Git: undo stage hunk",
				},
				{ "<leader>gp", gs.preview_hunk, desc = "Git: preview hunk" },
				{
					"<leader>gB",
					gs.toggle_current_line_blame,
					desc = "Git: Toggle line blame",
				},
				{ "<leader>gd", gs.diffthis, desc = "Git: diff this" },
				{
					"<leader>gb",
					function()
						gs.blame_line({ full = true })
					end,
					desc = "Git: blame line",
				},
				{
					"<leader>gD",
					function()
						gs.diffthis("~")
					end,
					desc = "Git diff this ~",
				},
				{
					mode = "v",
					{
						"<leader>hs",
						gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }),
						desc = "Git: stage hunk",
					},
					{
						"<leader>hr",
						gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }),
						desc = "Git: reset hunk",
					},
				},
			})
		end,
	},
}

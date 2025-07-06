return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	dependencies = "folke/which-key.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			vim.keymap.set(
				"n",
				"<leader>g]",
				gs.next_hunk,
				{ desc = "Git: next hunk" }
			)
			vim.keymap.set(
				"n",
				"<leader>g[",
				gs.prev_hunk,
				{ desc = "Git: prev hunk" }
			)
			vim.keymap.set(
				"n",
				"<leader>gs",
				gs.stage_hunk,
				{ desc = "Git: stage hunk" }
			)
			vim.keymap.set(
				"n",
				"<leader>gr",
				gs.prev_hunk,
				{ desc = "Git: prev hunk" }
			)
			vim.keymap.set(
				"n",
				"<leader>gS",
				gs.stage_buffer,
				{ desc = "Git: stage buffer" }
			)
			vim.keymap.set(
				"n",
				"<leader>gR",
				gs.reset_buffer,
				{ desc = "Git: reset buffer" }
			)
			vim.keymap.set(
				"n",
				"<leader>gu",
				gs.undo_stage_hunk,
				{ desc = "Git: undo stage hunk" }
			)
			vim.keymap.set(
				"n",
				"<leader>gp",
				gs.preview_hunk,
				{ desc = "Git: preview hunk" }
			)
			vim.keymap.set(
				"n",
				"<leader>gB",
				gs.toggle_current_line_blame,
				{ desc = "Git: Toggle line blame" }
			)
			vim.keymap.set(
				"n",
				"<leader>gd",
				gs.diffthis,
				{ desc = "Git: diff this" }
			)
			vim.keymap.set("n", "<leader>gb", function()
				gs.blame_line({ full = true })
			end, { desc = "Git: blame line" })
			vim.keymap.set("n", "<leader>gD", function()
				gs.diffthis("~")
			end, { desc = "Git diff this ~" })

			-- Визуальные бинды
			vim.keymap.set("v", "<leader>hs", function()
				gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git: stage hunk" })

			vim.keymap.set("v", "<leader>hr", function()
				gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "Git: reset hunk" })
		end,
	},
}

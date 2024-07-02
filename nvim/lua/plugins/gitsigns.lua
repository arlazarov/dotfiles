return {
	"lewis6991/gitsigns.nvim",
	lazy = false,
	dependencies = "folke/which-key.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			-- local function map(mode, l, r, desc)
			-- 	vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			-- end
			local wk = require("which-key")
			wk.register({
				g = {
					name = "Git",
					["]"] = { gs.next_hunk, "Git: next hunk" },
					["["] = { gs.prev_hunk, "Git: prev hunk" },
					s = { gs.stage_hunk, "Git: stage hunk" },
					r = { gs.prev_hunk, "Git: prev hunk" },
					S = { gs.stage_buffer, "Git: stage buffer" },
					R = { gs.reset_buffer, "Git: reset buffer" },
					u = { gs.undo_stage_hunk, "Git: undo stage hunk" },
					p = { gs.preview_hunk, "Git: preview hunk" },
					B = { gs.toggle_current_line_blame, "Git: Toggle line blame" },
					d = { gs.diffthis, "Git: diff this" },
					b = {
						function()
							gs.blame_line({ full = true })
						end,
						"Git: blame line",
					},
					D = {
						function()
							gs.diffthis("~")
						end,
						"Git diff this ~",
					},
				},
			}, { prefix = "<leader>", mode = "n" })
			wk.register({
				h = {
					s = { gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }), "Git: stage hunk" },
					r = { gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }), "Git: reset hunk" },
				},
			}, { prefix = "<leader>", mode = "v" })

			-- Text object
			-- map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Gitsigns select hunk")
		end,
	},
}

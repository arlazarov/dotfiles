return {
	"folke/noice.nvim",
	opts = {},
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			notify = { enabled = false },
			cmdline = { enabled = true },
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				presets = {
					lsp_doc_border = true,
				},
				progress = {
					enabled = false,
				},
				hover = {
					enabled = false,
					view = "hover",
				},
				signature = {
					enabled = false,
				},
				documentation = {
					opts = {
						border = { style = "single" },
						position = { row = 2 },
					},
				},
			},
			messages = {
				view = "notify",
				view_error = "notify",
				enabled = false,
			},
			popupmenu = {
				enabled = true,
			},
			commands = {
				history = {
					view = "split",
					opts = { enter = true, format = "details" },
					filter = {
						cond = function(_)
							return true
						end,
					},
				},
			},
			views = {
				cmdline_popup = {
					position = {
						row = 10,
						col = "50%",
					},
					border = {
						-- style = "none",
						-- padding = { 2, 3 },
					},
					size = {
						min_width = 60,
						width = "auto",
						height = "auto",
					},
					win_options = {
						winhighlight = {
							NormalFloat = "NormalFloat",
							FloatBorder = "FloatBorder",
						},
					},
				},
				cmdline_popupmenu = {
					relative = "editor",
					position = {
						row = 13,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
						max_height = 15,
					},
					border = {
						-- style = "none",
						-- padding = { 0, 3 },
					},
					win_options = {
						winhighlight = {
							NormalFloat = "NormalFloat",
							FloatBorder = "NoiceCmdlinePopupBorder",
						},
					},
				},
				hover = {
					border = {
						style = "single",
					},
				},
				confirm = {
					border = {
						style = "single",
					},
				},
				popup = {
					border = {
						style = "single",
					},
				},
			},

			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
							{ find = "fewer lines" },

							{ find = "no lines in buffer" },
							-- Edit
							{ find = "%d+ less lines" },
							{ find = "%d+ fewer lines" },
							{ find = "%d+ more lines" },
							{ find = "%d+ change;" },
							{ find = "%d+ line less;" },
							{ find = "%d+ more lines?;" },
							{ find = "%d+ fewer lines;?" },
							{ find = '".+" %d+L, %d+B' },
							{ find = "%d+ lines yanked" },
							{ find = "^Hunk %d+ of %d+$" },
							{ find = "%d+L, %d+B$" },
							{ find = "^[/?].*" }, -- Searching up/down
							{ find = "E486: Pattern not found:" }, -- Searcingh not found
							{ find = "%d+ changes?;" }, -- Undoing/redoing
							{ find = "%d+ fewer lines" }, -- Deleting multiple lines
							{ find = "%d+ more lines" }, -- Undoing deletion of multiple lines
							{ find = "%d+ lines " }, -- Performing some other verb on multiple lines
							{ find = "Already at newest change" }, -- Redoing
							{ find = '"[^"]+" %d+L, %d+B' }, -- Saving

							-- Save
							{ find = " bytes written" },

							-- Redo/Undo
							{ find = " changes; before #" },
							{ find = " changes; after #" },
							{ find = "1 change; before #" },
							{ find = "1 change; after #" },

							-- Yank
							{ find = " lines yanked" },

							-- Move lines
							{ find = " lines moved" },
							{ find = " lines indented" },

							-- Bulk edit
							{ find = " fewer lines" },
							{ find = " more lines" },
							{ find = "1 more line" },
							{ find = "1 line less" },

							-- General messages
							{ find = "Already at newest change" }, -- Redoing
							{ find = "Already at oldest change" },
						},
					},
					opts = { skip = true },
				},
			},
		})
	end,
}

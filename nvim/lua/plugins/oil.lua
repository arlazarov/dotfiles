return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("oil").setup({
			default_file_explorer = true,
			columns = {
				"icon",
			},
			buf_options = {
				buflisted = false,
				bufhidden = "hide",
			},
			win_options = {
				wrap = false,
				signcolumn = "no",
				cursorcolumn = false,
				foldcolumn = "0",
				spell = false,
				list = false,
				conceallevel = 3,
				concealcursor = "nvic",
			},
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			prompt_save_on_select_new_entry = true,
			cleanup_delay_ms = 2000,
			lsp_file_methods = {
				timeout_ms = 1000,
				autosave_changes = false,
			},
			constrain_cursor = "editable",
			watch_for_changes = false,
			keymaps = {
				["g?"] = "actions.show_help",
				["<CR>"] = "actions.select",
				["<C-v>"] = {
					"actions.select",
					opts = { vertical = true },
					desc = "Open in vertical split",
				},
				["<C-h>"] = {
					"actions.select",
					opts = { horizontal = true },
					desc = "Open in horizontal split",
				},
				["<C-t>"] = {
					"actions.select",
					opts = { tab = true },
					desc = "Open in new tab",
				},
				["<C-p>"] = "actions.preview",
				["<C-c>"] = "actions.close",
				["<C-l>"] = "actions.refresh",
				["-"] = "actions.parent",
				["_"] = "actions.open_cwd",
				["`"] = "actions.cd",
				["~"] = {
					"actions.cd",
					opts = { scope = "tab" },
					desc = ":tcd to current oil directory",
				},
				["gs"] = "actions.change_sort",
				["gx"] = "actions.open_external",
				["g."] = "actions.toggle_hidden",
				["g\\"] = "actions.toggle_trash",
			},
			use_default_keymaps = true,
			view_options = {
				show_hidden = true,
				is_hidden_file = function(name, bufnr)
					return vim.startswith(name, ".")
				end,
				is_always_hidden = function(name, bufnr)
					return false
				end,
				natural_order = true,
				case_insensitive = false,
				sort = {
					{ "type", "asc" },
					{ "name", "asc" },
				},
			},
			float = {
				padding = 2,
				max_width = 0,
				max_height = 0,
				border = "rounded",
				win_options = {
					winblend = 0,
				},
				preview_split = "auto",
				override = function(conf)
					return conf
				end,
			},
			preview = {
				max_width = 0.9,
				min_width = { 40, 0.4 },
			},
		})

		require("which-key").add({
			{
				"<leader>o",
				function()
					require("oil").open(".")
				end,
				desc = "Oil",
			},
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "OilEnter",
			callback = vim.schedule_wrap(function(args)
				local oil = require("oil")
				if
					vim.api.nvim_get_current_buf() == args.data.buf
					and oil.get_cursor_entry()
				then
					oil.open_preview()
				end
			end),
		})
	end,
}

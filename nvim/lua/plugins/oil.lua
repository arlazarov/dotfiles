return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		default_file_explorer = true, -- заменяет netrw
		skip_confirm_for_simple_edits = true, -- без подтверждений на mkdir/rename
		delete_to_trash = true, -- использует trash вместо rm
		disable_default_keymaps = false,
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-s>"] = "actions.select_vsplit",
			["<C-h>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["q"] = "actions.close",
			["<Esc>"] = "actions.close",
			["<C-r>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
		},
		view_options = {
			show_hidden = true,
			natural_order = true,
			is_always_hidden = function(name, _)
				return name == ".." or name == ".git"
			end,
		},
		win_options = {
			wrap = true,
		},
		prompt_save_on_select_new_entry = false,
		use_default_keymaps = true,
		restore_win_options = true,
		cleanup_delay_ms = 2000,
	},
	keys = {
		{
			"<leader>q",
			function()
				require("oil").open()
			end,
			desc = "Oil: Открыть текущую директорию",
		},
		{
			"<leader>e",
			function()
				require("oil").open(vim.fn.expand("%:p:h"))
			end,
			desc = "Oil: Открыть директорию файла",
		},
	},
}

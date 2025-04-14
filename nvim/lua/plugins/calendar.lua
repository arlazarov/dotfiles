return {
	-- "mattn/calendar-vim",
	"hotoo/calendar-vim",
	-- "nvim-telekasten/calendar-vim",
	config = function()
		vim.g.calendar_options = "nornu"
		vim.g.calendar_diary_path_pattern = "{DD}-{MM}-{YYYY}{EXT}"
		vim.g.calendar_diary_list = {
			{
				name = "daily-notes",
				path = vim.fn.expand("~/Vault/daily-notes/"),
				ext = ".md",
			},
		}

		vim.api.nvim_set_keymap(
			"n",
			"<leader>oc",
			"<cmd>silent! CalendarVR<CR>",
			{ noremap = true, silent = true, desc = "[C]alendar" },
			vim.api.nvim_set_keymap(
				"n",
				"<leader>oC",
				"<cmd>silent! CalendarT<CR>",
				{ noremap = true, silent = true, desc = "Big [C]alendar" }
			)
		)
	end,
}

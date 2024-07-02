return {
	"j-morano/buffer_manager.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/which-key.nvim",
	},
	config = function()
		local buffer_m = require("buffer_manager")
		buffer_m.setup({
			select_menu_item_commands = {
				v = {
					key = "<C-v>",
					command = "vsplit",
				},
				h = {
					key = "<C-s>",
					command = "split",
				},
			},
			focus_alternate_buffer = false,
			short_file_names = true,
			short_term_names = true,
			loop_nav = true,
			highlight = "Normal:BufferManagerBorder",
			win_extra_options = {
				winhighlight = "Normal:BufferManagerNormal",
			},
		})

		local buffer = require("buffer_manager.ui")
		require("which-key").register({
			b = {
				o = {
					function()
						buffer.toggle_quick_menu()
					end,
					"Buffer: toggle",
				},
			},
		}, { prefix = "<space>" })
	end,
}

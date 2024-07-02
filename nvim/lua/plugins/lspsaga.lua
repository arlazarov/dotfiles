return {
	"glepnir/lspsaga.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local saga = require("lspsaga")
		saga.setup({
			move_in_saga = { prev = "<C-k>", next = "<C-j>" },
			definition_action_keys = { edit = "<CR>" },
			-- Disable the light bulb
			code_action_lightbulb = { enable = false },
			debug = false,
			use_saga_diagnostic_sign = true,
			-- Diagnostic signs
			diagnostic_signs = {
				error = "",
				warn = "",
				hint = "",
				info = "",
			},
			diagnostic_header_icon = "   ",
			code_action_icon = " ",
			finder_definition_icon = "  ",
			finder_reference_icon = "  ",
			max_preview_lines = 10,
			finder_action_keys = {
				open = "o",
				vsplit = "s",
				split = "i",
				quit = "q",
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
			},
			code_action_keys = { quit = "q", exec = "<CR>" },
			rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
			definition_preview_icon = "  ",
			border_style = "rounded",
			rename_prompt_prefix = "➤",
			rename_output_qflist = {
				enable = false,
				auto_open_qflist = false,
			},
			server_filetype_map = {},
			diagnostic_prefix_format = "%d. ",
			diagnostic_message_format = "%m %c",
			highlight_prefix = false,
		})
	end,
}

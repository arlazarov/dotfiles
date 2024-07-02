return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	lazy = false,
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,

	opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = true,
		expr = false,
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		operators = { gc = "Comments" },
		key_labels = {},
		motions = {
			count = false,
		},
		icons = {
			breadcrumb = "»",
			separator = "➜",
			group = "+ ",
		},
		popup_mappings = {
			scroll_down = "<c-d>",
			scroll_up = "<c-u>",
		},
		window = {
			border = "none",
			position = "bottom",
			margin = { 1, 0, 1, 0 },
			padding = { 1, 2, 1, 2 },
			winblend = 0,
			zindex = 1000,
		},
		layout = {
			height = { min = 4, max = 25 },
			width = { min = 20, max = 50 },
			spacing = 3,
			align = "left",
		},
		ignore_missing = true,
		hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "^:", "^ ", "^call ", "^lua " },
		show_help = false,
		show_keys = true,
		triggers = "auto",
		triggers_nowait = {
			"`",
			"'",
			"g`",
			"g'",
			'"',
			"<c-r>",
			"z=",
		},
		triggers_blacklist = {
			i = { "j", "k" },
			v = { "j", "k" },
		},
		disable = {
			buftypes = {},
			filetypes = { "NvimTree" },
		},
	},
}

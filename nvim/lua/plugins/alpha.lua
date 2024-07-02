return {
	"goolord/alpha-nvim",
	dependencies = "folke/which-key.nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- ASCII Art Logo
		dashboard.section.header.val = {
			"                                                     ",
			"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
			"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
			"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
			"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
			"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"                                                     ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("r", "  > Recently used files", ":Telescope oldfiles <CR>"),
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("f", "  > Find File", ":Telescope find_files <CR>"),
			dashboard.button("p", "  > Projects", ":Telescope projects <CR>"),
			dashboard.button("s", "󰁯  > Restore Session", "<cmd>SessionRestore<CR>"),
			dashboard.button("i", "  > Settings", ":e ~/.config/nvim/lua/settings.lua <CR>"),
			dashboard.button("m", "  > Keymaps", ":e ~/.config/nvim/lua/keymaps.lua <CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Setup Alpha with dashboard options
		alpha.setup(dashboard.opts)

		-- Disable folding in alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		-- Register which-key mapping for Alpha
		require("which-key").register({
			a = { "<cmd>Alpha<cr>", "Alpha" },
		}, { prefix = "<leader>" })
	end,
}

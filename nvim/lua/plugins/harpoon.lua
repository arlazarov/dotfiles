return {
	"ThePrimeagen/harpoon",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/which-key.nvim",
	},

	config = function()
		require("harpoon").setup({
			tabline = true,
			tabline_prefix = "   ",
			tabline_suffix = "   ",
		})

		vim.cmd("highlight! HarpoonInactive guibg=#112638 guifg=#c3ccdc")
		vim.cmd("highlight! HarpoonActive guibg=#65D1FF guifg=#112638")
		vim.cmd("highlight! HarpoonNumberActive guibg=#65D1FF guifg=#112648")
		vim.cmd("highlight! HarpoonNumberInactive guibg=#112638 guifg=#c3ccdc")
		vim.cmd("highlight! TabLineFill guibg=#112638 guifg=white")

		-- Setup which-key bindings
		local wk = require("which-key")
		wk.register({
			["<cr>"] = {
				function()
					require("harpoon.ui").nav_next()
				end,
				"Harpoon: Next File",
			},
			h = {
				name = "Harpoon",
				a = {
					function()
						require("harpoon.mark").add_file()
						vim.cmd("e")
					end,
					"Harpoon: Add File",
				},
				o = {
					function()
						require("harpoon.ui").toggle_quick_menu()
					end,
					"Harpoon: Toggle Menu",
				},
				["1"] = {
					function()
						require("harpoon.ui").nav_file(1)
					end,
					"Harpoon: Navigate to 1",
				},
				["2"] = {
					function()
						require("harpoon.ui").nav_file(2)
					end,
					"Harpoon: Navigate to 2",
				},
				["3"] = {
					function()
						require("harpoon.ui").nav_file(3)
					end,
					"Harpoon: Navigate to 3",
				},
				["4"] = {
					function()
						require("harpoon.ui").nav_file(4)
					end,
					"Harpoon: Navigate to 4",
				},
				n = {
					function()
						require("harpoon.ui").nav_next()
					end,
					"Harpoon: Next File",
				},
				p = {
					function()
						require("harpoon.ui").nav_prev()
					end,
					"Harpoon: Previous File",
				},
				d = {
					function()
						require("harpoon.mark").rm_file()
						vim.cmd("e")
					end,
					"Harpoon: Remove File",
				},
				c = {
					function()
						require("harpoon.mark").clear_all()
						vim.cmd("e")
					end,
					"Harpoon: Clear All Files",
				},
			},
		}, { prefix = "<leader>" })

		vim.keymap.set("n", "<leader><cr>", function()
			require("harpoon.ui").nav_next()
		end, { noremap = true, silent = true })
	end,
}

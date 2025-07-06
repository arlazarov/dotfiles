return {
	"ThePrimeagen/harpoon",
	priority = 1,

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
		vim.cmd("highlight! HarpoonActive guibg=#65D1FF guifg=black")
		vim.cmd("highlight! HarpoonNumberActive guibg=#65D1FF guifg=black")
		vim.cmd("highlight! HarpoonNumberInactive guibg=#112638 guifg=#c3ccdc")
		vim.cmd("highlight! TabLineFill guibg=#112638 guifg=white")

		local harpoon_mark = require("harpoon.mark")
		local harpoon_ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>h", "<nop>", { desc = "Harpoon" })

		vim.keymap.set("n", "<leader>ha", function()
			harpoon_mark.add_file()
			vim.cmd("e")
		end, { desc = "Harpoon: Add File" })

		vim.keymap.set(
			"n",
			"<leader>ho",
			harpoon_ui.toggle_quick_menu,
			{ desc = "Harpoon: Toggle Menu" }
		)

		vim.keymap.set("n", "<leader>h1", function()
			harpoon_ui.nav_file(1)
		end, { desc = "Harpoon: Navigate to 1" })
		vim.keymap.set("n", "<leader>h2", function()
			harpoon_ui.nav_file(2)
		end, { desc = "Harpoon: Navigate to 2" })
		vim.keymap.set("n", "<leader>h3", function()
			harpoon_ui.nav_file(3)
		end, { desc = "Harpoon: Navigate to 3" })
		vim.keymap.set("n", "<leader>h4", function()
			harpoon_ui.nav_file(4)
		end, { desc = "Harpoon: Navigate to 4" })

		vim.keymap.set(
			"n",
			"<leader>hn",
			harpoon_ui.nav_next,
			{ desc = "Harpoon: Next File" }
		)
		vim.keymap.set(
			"n",
			"<leader>hp",
			harpoon_ui.nav_prev,
			{ desc = "Harpoon: Previous File" }
		)

		vim.keymap.set("n", "<leader>hd", function()
			harpoon_mark.rm_file()
			vim.cmd("e")
		end, { desc = "Harpoon: Remove File" })

		vim.keymap.set("n", "<leader>hc", function()
			harpoon_mark.clear_all()
			vim.cmd("e")
		end, { desc = "Harpoon: Clear All Files" })

		vim.keymap.set("n", "<leader><CR>", harpoon_ui.nav_next)
		vim.keymap.set("n", "<M-C-l>", harpoon_ui.nav_next)
		vim.keymap.set("n", "<M-C-h>", harpoon_ui.nav_prev)
	end,
}

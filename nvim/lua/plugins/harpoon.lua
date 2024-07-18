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

		-- Setup which-key bindings
		require("which-key").add({
			{
				"<cr>",
				function()
					require("harpoon.ui").nav_next()
				end,
				desc = "Harpoon: Next File",
			},
			{ "<leader>h", group = "Harpoon" },
			{
				"<leader>ha",
				function()
					require("harpoon.mark").add_file()
					vim.cmd("e")
				end,
				desc = "Harpoon: Add File",
			},
			{
				"<leader>ho",
				function()
					require("harpoon.ui").toggle_quick_menu()
				end,
				desc = "Harpoon: Toggle Menu",
			},
			{
				"<leader>h1",
				function()
					require("harpoon.ui").nav_file(1)
				end,
				desc = "Harpoon: Navigate to 1",
			},
			{
				"<leader>h2",
				function()
					require("harpoon.ui").nav_file(2)
				end,
				desc = "Harpoon: Navigate to 2",
			},
			{
				"<leader>h3",
				function()
					require("harpoon.ui").nav_file(3)
				end,
				desc = "Harpoon: Navigate to 3",
			},
			{
				"<leader>h4",
				function()
					require("harpoon.ui").nav_file(4)
				end,
				desc = "Harpoon: Navigate to 4",
			},
			{
				"<leader>hn",
				function()
					require("harpoon.ui").nav_next()
				end,
				desc = "Harpoon: Next File",
			},
			{
				"<leader>hp",
				function()
					require("harpoon.ui").nav_prev()
				end,
				desc = "Harpoon: Previous File",
			},
			{
				"<leader>hd",
				function()
					require("harpoon.mark").rm_file()
					vim.cmd("e")
				end,
				desc = "Harpoon: Remove File",
			},
			{
				"<leader>hc",
				function()
					require("harpoon.mark").clear_all()
					vim.cmd("e")
				end,
				desc = "Harpoon: Clear All Files",
			},
			{
				"<leader><cr>",
				function()
					require("harpoon.ui").nav_next()
				end,
			},
			{
				"<M-C-l>",
				function()
					require("harpoon.ui").nav_next()
				end,
			},
			{
				"<M-C-h>",
				function()
					require("harpoon.ui").nav_prev()
				end,
			},
		})
	end,
}

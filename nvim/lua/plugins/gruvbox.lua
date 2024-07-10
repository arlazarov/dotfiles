return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			undercurl = true,
			underline = true,
			bold = true,
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true,
			contrast = "hard",
			overrides = {
				Normal = { bg = "none" },
				SignColumn = { bg = "none" },
			},
		})
		vim.cmd("colorscheme gruvbox")
	end,
}

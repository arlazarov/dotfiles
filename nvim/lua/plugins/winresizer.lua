return {
	"simeji/winresizer",
	dependencies = "folke/which-key.nvim",
	lazy = false,
	init = function()
		vim.g.winresizer_start_key = ""
	end,
	config = function()
		vim.keymap.set("n", "<C-w>r", "<cmd>WinResizerStartResize<cr>")
	end,
}

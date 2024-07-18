return {
	"simeji/winresizer",
	dependencies = "folke/which-key.nvim",
	lazy = false,
	config = function()
		vim.g.winresizer_start_key_enable = 0
		require("which-key").add({
			"<C-w>r",
			"<cmd>WinResizerStartResize<cr>",
		})
	end,
}

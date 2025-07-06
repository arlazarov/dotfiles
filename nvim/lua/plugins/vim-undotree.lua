return {
	"mbbill/undotree",
	dependencies = "folke/which-key.nvim",
	config = function()
		vim.keymap.set(
			"n",
			"<leader>\\",
			"<cmd>UndotreeToggle<cr>",
			{ desc = "UndoTree toggle" }
		)
	end,
}

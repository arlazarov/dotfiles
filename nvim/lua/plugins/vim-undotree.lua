return {
	"mbbill/undotree",
	dependencies = "folke/which-key.nvim",
	config = function()
		require("which-key").add({
			{
				"<leader>\\",
				"<cmd>UndotreeToggle<cr>",
				desc = "UndoTree toggle",
			},
		})
	end,
}

return {
	"mbbill/undotree",
	dependencies = "folke/which-key.nvim",
	config = function()
		require("which-key").register({
			["\\"] = { "<cmd>UndotreeToggle<cr>", "UndoTree toggle" },
		}, { prefix = "<leader>" })
	end,
}

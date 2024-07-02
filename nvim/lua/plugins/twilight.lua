return {
	"folke/twilight.nvim",
	dependencies = "folke/which-key.nvim",
	opts = {
		dimming = {
			alpha = 0.25,
			color = { "Normal", "#ffffff" },
			term_bg = "#000000",
			inactive = false,
		},
		context = 15,
		treesitter = true,
		expand = {
			"function",
			"method",
			"table",
			"if_statement",
		},
	},
	-- require("which-key").register({
	-- 	tt = { "<cmd>Twilight<cr>", "Twilight" },
	-- }, { prefix = "<leader>" }),
}

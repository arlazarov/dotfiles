return {
	"folke/zen-mode.nvim",
	dependencies = {
		"folke/twilight.nvim",
		"folke/which-key.nvim",
	},
	opts = {
		window = { backdrop = 0.9, width = 84, height = 1 },
		plugins = {
			options = {
				enabled = true,
				ruler = false,
				showcmd = false,
				number = false,
			},
			twilight = { enabled = false },
			gitsigns = { enabled = true },
			kitty = { enabled = false, font = "+5" },
		},
	},
	require("which-key").add({
		{ "<leader>z", "<cmd>ZenMode<cr>", desc = "ZenMode: toggle" },
	}),
}

return {
	"olrtg/nvim-emmet",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "folke/which-key.nvim",
	config = function()
		require("which-key").register({
			["."] = {
				function()
					require("nvim-emmet").wrap_with_abbreviation()
				end,
				"Emmet: wrap",
			},
		}, { prefix = "<leader>" })
	end,
}

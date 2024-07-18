return {
	"olrtg/nvim-emmet",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "folke/which-key.nvim",
	config = function()
		require("which-key").add({
			"<leader>.",
			function()
				require("nvim-emmet").wrap_with_abbreviation()
			end,
			desc = "Emmet: wrap",
		})
	end,
}

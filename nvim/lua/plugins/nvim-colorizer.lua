return {
	"NvChad/nvim-colorizer.lua",
	event = "VeryLazy",
	enabled = false,
	ft = { "lua", "vim", "bash", "zsh" },
	opts = true,
	config = function()
		require("colorizer").setup({
			scss = { hsl_fn = true },
		})
	end,
}

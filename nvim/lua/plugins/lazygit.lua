return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/which-key.nvim",
	},
	event = "VeryLazy",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	config = function()
		require("telescope").load_extension("lazygit")
		require("which-key").register({
			g = {
				name = "LazyGit",
				g = { "<cmd>LazyGit<cr>", "LazyGit: open" },
				f = {
					function()
						require("telescope").extensions.lazygit.lazygit()
					end,
					"LazyGit: find",
				},
			},
		}, { prefix = "<space>" })
	end,
}

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
		require("which-key").add({
			{ "<leader>g", group = "LazyGit" },
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit: open" },
			{
				"<leader>gf",
				function()
					require("telescope").extensions.lazygit.lazygit()
				end,
				desc = "LazyGit: find",
			},
		})
	end,
}

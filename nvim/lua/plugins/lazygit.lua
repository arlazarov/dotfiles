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

		vim.keymap.set("n", "<leader>g", "<nop>", { desc = "LazyGit" })
		vim.keymap.set(
			"n",
			"<leader>gg",
			"<cmd>LazyGit<cr>",
			{ desc = "LazyGit: open" }
		)
		vim.keymap.set("n", "<leader>gf", function()
			require("telescope").extensions.lazygit.lazygit()
		end, { desc = "LazyGit: find" })
	end,
}

return {
	"rmagatti/auto-session",
	dependencies = "folke/which-key.nvim",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
		})

		require("which-key").register({
			s = {
				name = "Session",
				r = { "<cmd>SessionRestore<cr>", "Session: restore" },
				s = { "<cmd>SessionSave<cr>", "Session: save" },
			},
		}, { prefix = "<space>" })
	end,
}

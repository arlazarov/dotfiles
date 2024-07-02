return {
	"mfussenegger/nvim-lint",
	dependencies = "folke/which-key.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint" },
		}

		local eslint_d = require("lint").linters.eslint_d
		eslint_d.args = {
			"--no-warn-ignored",
			"--format",
			"json",
			"--stdin",
			"--stdin-filename",
			function()
				return vim.api.nvim_buf_get_name(0)
			end,
		}

		local lint_augroup =
			vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd(
			{ "BufEnter", "BufWritePost", "InsertLeave" },
			{
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			}
		)

		require("which-key").register({
			l = {
				function()
					lint.try_lint()
				end,
				"Lint current file",
			},
		}, { prefix = "<backspace>" })
	end,
}

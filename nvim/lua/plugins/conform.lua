return {
	"stevearc/conform.nvim",
	dependencies = "folke/which-key.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "eslint_d", "prettier" },
				typescriptreact = { "eslint_d", "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			formatters = {
				prettier = {
					prepend_args = {
						"--single-quote",
						"--print-width",
						"80",
						"--arrow-parens",
						"avoid",
						"--trailing-comma",
						"all",
					},
				},
				stylua = {
					prepend_args = {
						"--column-width",
						"80",
					},
				},
				eslint_d = {
					prepend_args = {
						"--fix",
					},
				},
			},
		})

		require("which-key").register({
			["<leader>"] = {
				function()
					conform.format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 1000,
					})
				end,
				"Format file",
			},
		}, { prefix = "<leader>", mode = { "n", "v" } })
	end,
}

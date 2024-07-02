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
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
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
						"--use-tabs",
						"--print-width",
						"80",
						"--arrow-parens",
						"avoid",
					},
				},
				stylua = {
					prepend_args = {
						"--column-width",
						"80",
					},
				},
			},
		})

		require("which-key").register({
			["<leader>f"] = {
				function()
					conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
				end,
				"Format file",
			},
		}, { prefix = "<leader>", mode = { "n", "v" } })
	end,
}

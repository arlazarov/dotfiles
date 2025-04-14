return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				cs = { "clang_format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "eslint_d", "prettier" },
				typescriptreact = { "eslint_d", "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
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
						"--bracket-same-line",
						"false",
					},
					stdin = true,
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
				clang_format = {
					command = "clang-format",
					prepend_args = {
						"--style",
						[[{
					 "BasedOnStyle": "Microsoft",
            "IndentWidth": 2,
            "TabWidth": 2,
            "UseTab": "Never",
            "SortIncludes": true,
            "BreakBeforeBraces": "Attach",
            "AllowShortFunctionsOnASingleLine": "None",
            "SpacesInParentheses": false,
            "PointerAlignment": "Left",
            "ColumnLimit": 120,
            "BinPackArguments": false,
            "BinPackParameters": false,
            "PenaltyBreakBeforeFirstCallParameter": 500,
            "PenaltyExcessCharacter": 200
    }]],
						"--assume-filename",
						vim.fn.expand("%:t"),
					},
					-- clang_format = {
					-- 	command = "clang-format",
					-- 	prepend_args = {
					-- 		"--style",
					-- 		[[{
					--         "BasedOnStyle": "Microsoft",
					--         "IndentWidth": 2,
					--         "TabWidth": 2,
					--         "UseTab": "Never",
					--         "SortIncludes": true,
					--         "BreakBeforeBraces": "Allman",
					-- 	  "ColumnLimit": 80,
					--         "AllowShortFunctionsOnASingleLine": "All",
					--         "SpacesInParentheses": false,
					--         "PointerAlignment": "Left"
					--     }]],
					-- 		"--assume-filename",
					-- 		vim.fn.expand("%:t"),
					-- 	},
					stdin = true,
					async = true,
				},
			},
			format_on_save = {
				async = false,
				timeout_ms = 2000,
			},
		})

		vim.keymap.set("n", "<leader><leader>", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file" })
	end,
}

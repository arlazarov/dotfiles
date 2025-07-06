return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				cs = { "csharpier" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				-- markdown = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				lua = { "stylua" },
			},

			formatters = {
				prettier = {
					command = "prettier",
					args = function(bufnr)
						bufnr = tonumber(bufnr)
							or vim.api.nvim_get_current_buf()
						local file = vim.api.nvim_buf_get_name(bufnr)
						local ft = vim.bo[bufnr].filetype

						local parser = ({
							javascript = "babel",
							typescript = "typescript",
							javascriptreact = "babel",
							typescriptreact = "typescript",
							json = "json",
							html = "html",
							yaml = "yaml",
							markdown = "markdown",
							css = "css",
							scss = "scss",
						})[ft] or "babel"

						return {
							"--parser",
							parser,
							"--stdin-filepath",
							file,
							"--single-quote",
							"--print-width",
							"80",
							"--arrow-parens",
							"avoid",
							"--trailing-comma",
							"all",
							"--bracket-same-line",
							"false",
						}
					end,
					stdin = true,
				},

				csharpier = {
					command = "csharpier",
					args = {
						"--write-stdout",
						"--fast",
						"--config-path",
						vim.fn.expand("~/.config/csharpier/csharpier.json"),
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
					args = function(bufnr)
						bufnr = tonumber(bufnr)
							or vim.api.nvim_get_current_buf()
						local filename = vim.api.nvim_buf_get_name(bufnr)

						return {
							"--style",
							[[{
  BasedOnStyle: Microsoft,
  IndentWidth: 2,
  TabWidth: 2,
  UseTab: Never,
  ColumnLimit: 120,
  BreakBeforeBraces: Attach,
  AllowShortFunctionsOnASingleLine: Inline,
  SortIncludes: true,
  SpacesInParentheses: false,
  PointerAlignment: Left,
  SpaceAfterCStyleCast: false,
  AlignAfterOpenBracket: DontAlign,
  AlignOperands: false,
  AllowShortIfStatementsOnASingleLine: true,
  ReflowComments: true,
  Cpp11BracedListStyle: false,
  SpaceBeforeParens: ControlStatements,
  BreakConstructorInitializers: BeforeComma,
  ConstructorInitializerAllOnOneLineOrOnePerLine: false
}]],
							"--assume-filename",
							filename,
						}
					end,
					stdin = true,
					async = true,
				},
			},

			format_on_save = {
				async = false,
				timeout_ms = 2000,
			},
		})

		-- Razor HTML chunk
		vim.keymap.set("v", "<leader>.", function()
			require("conform").format({
				formatters = { "prettier" },
				lsp_fallback = false,
				async = false,
				timeout_ms = 2000,
				range = {
					start = vim.api.nvim_buf_get_mark(0, "<"),
					["end"] = vim.api.nvim_buf_get_mark(0, ">"),
				},
			})
		end, { desc = "Format selected range in Razor as HTML" })

		-- Razor C# chunk
		vim.keymap.set("v", "<leader>,", function()
			if vim.bo.filetype == "razor" then
				require("conform").format({
					formatters = { "clang_format" },
					lsp_fallback = false,
					async = false,
					timeout_ms = 2000,
					range = {
						start = vim.api.nvim_buf_get_mark(0, "<"),
						["end"] = vim.api.nvim_buf_get_mark(0, ">"),
					},
				})
			end
		end, { desc = "Format Razor selection as C#" })

		-- Format whole file
		vim.keymap.set("n", "<leader><leader>", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 2000,
			})
		end, { desc = "Format file" })
	end,
}

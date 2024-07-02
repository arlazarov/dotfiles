local M = {}

function M.map(bufnr)
	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = bufnr,
		silent = true,
		noremap = true,
		nowait = true,
	}

	local mappings = {
		-- Show documentation
		["?"] = { "<cmd>Lspsaga hover_doc<cr>", "LSP: show documentation" },
		-- Code snippets
		["+"] = { "<cmd>Telescope luasnip<cr>", "Code: snippets" },
		-- LSP actions
		l = {
			name = "LSP",
			-- Inlay hints
			h = {
				function()
					vim.lsp.inlay_hint.enable(true)
				end,
				"inlay hints",
			},
			-- Code action
			a = { "<cmd>:Lspsaga code_action<cr>", "code action" },
			-- Rename
			r = { vim.lsp.buf.rename, "rename" },
			-- Restart LSP server
			R = { "<cmd>LspRestart<cr>", "restart server" },
			-- Peek actions
			p = {
				name = "Peek",
				d = { "<cmd>Lspsaga peek_definition<cr>", "peek definition" },
				t = { "<cmd>Lspsaga peek_type_definition<cr>", "peek type def." },
			},
			-- Go to actions
			g = {
				name = "Go to",
				d = { "<cmd>Lspsaga goto_definition<cr>", "go to definition" },
				t = { "<cmd>Lspsaga goto_type_definition<cr>", "go to type def." },
				r = { "<cmd>Telescope lsp_references<cr>", "references" },
				i = { "<cmd>Telescope lsp_implementations<cr>", "implementations" },
				D = { vim.lsp.buf.declaration, "go to declaration" },
			},
			-- Diagnostic actions
			d = {
				name = "Diagnostic",
				D = { "<cmd>Telescope diagnostics bufnr=0<cr>", "diagnostics for file" },
				d = { vim.diagnostic.open_float, "diagnostics for line" },
				f = { "<cmd>lua require('echo-diagnostics').echo_entire_diagnostic()<cr>", "echo diagnostics" },
			},
		},
	}
	require("which-key").register(mappings, opts)
end

return M

local M = {}

function M.map(bufnr)
	require("which-key").add({
		-- Show documentation
		{
			"<Leader>?",
			"<cmd>Lspsaga hover_doc<cr>",
			desc = "LSP: show documentation",
		},
		-- Code snippets
		{ "<leader>+", "<cmd>Telescope luasnip<cr>", desc = "Code: snippets" },
		-- LSP actions
		{ "<leader>l", group = "LSP" },
		-- Inlay hints
		{
			"<leader>lh",
			function()
				vim.lsp.inlay_hint.enable(true)
			end,
			desc = "inlay hints",
		},
		-- Code action
		{
			"<leader>la",
			"<cmd>:Lspsaga code_action<cr>",
			desc = "code action",
		},
		-- Rename
		{ "<leader>lr", vim.lsp.buf.rename, desc = "rename" },
		-- Restart LSP server
		{ "<leader>lR", "<cmd>LspRestart<cr>", desc = "restart server" },
		-- Peek actions
		{ "<leader>lp", group = "Peek" },
		{
			"<leader>lpd",
			"<cmd>Lspsaga peek_definition<cr>",
			desc = "peek definition",
		},
		{
			"<leader>lpt",
			"<cmd>Lspsaga peek_type_definition<cr>",
			desc = "peek type def.",
		},
		-- Go to actions
		{ "<leader>lg", group = "Go to" },
		{
			"<leader>lgd",
			"<cmd>Lspsaga goto_definition<cr>",
			desc = "go to definition",
		},
		{
			"<leader>lgt",
			"<cmd>Lspsaga goto_type_definition<cr>",
			desc = "go to type def.",
		},
		{
			"<leader>lgr",
			"<cmd>Telescope lsp_references<cr>",
			desc = "references",
		},
		{
			"<leader>lgi",
			"<cmd>Telescope lsp_implementations<cr>",
			desc = "implementations",
		},
		{ "<leader>lgD", vim.lsp.buf.declaration, desc = "go to declaration" },
		-- Diagnostic actions
		{ "<leader>ld", group = "Diagnostic" },
		{
			"<leader>ldD",
			"<cmd>Telescope diagnostics bufnr=0<cr>",
			desc = "diagnostics for file",
		},
		{
			"<leader>ldd",
			"vim.diagnostic.open_float",
			desc = "diagnostics for line",
		},
		{
			"<leader>ldf",
			"<cmd>lua require('echo-diagnostics').echo_entire_diagnostic()<cr>",
			desc = "echo diagnostics",
		},
	})
end

return M

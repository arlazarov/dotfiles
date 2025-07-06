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

	local map = vim.keymap.set
	local opts = { noremap = true, silent = true }

	-- LSP
	map("n", "<leader>l", "<nop>", { desc = "LSP" })

	map("n", "<leader>lh", function()
		vim.lsp.inlay_hint.enable(true)
	end, { desc = "LSP: inlay hints" })
	map(
		"n",
		"<leader>la",
		"<cmd>Lspsaga code_action<cr>",
		{ desc = "LSP: code action" }
	)
	map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP: rename" })
	map(
		"n",
		"<leader>lR",
		"<cmd>LspRestart<cr>",
		{ desc = "LSP: restart server" }
	)

	-- LSP Peek
	map(
		"n",
		"<leader>lpd",
		"<cmd>Lspsaga peek_definition<cr>",
		{ desc = "LSP: peek definition" }
	)
	map(
		"n",
		"<leader>lpt",
		"<cmd>Lspsaga peek_type_definition<cr>",
		{ desc = "LSP: peek type def." }
	)

	-- LSP Go to
	map(
		"n",
		"<leader>lgd",
		"<cmd>Lspsaga goto_definition<cr>",
		{ desc = "LSP: go to definition" }
	)
	map(
		"n",
		"<leader>lgt",
		"<cmd>Lspsaga goto_type_definition<cr>",
		{ desc = "LSP: go to type def." }
	)
	map(
		"n",
		"<leader>lgr",
		"<cmd>Telescope lsp_references<cr>",
		{ desc = "LSP: references" }
	)
	map(
		"n",
		"<leader>lgi",
		"<cmd>Telescope lsp_implementations<cr>",
		{ desc = "LSP: implementations" }
	)
	map(
		"n",
		"<leader>lgD",
		vim.lsp.buf.declaration,
		{ desc = "LSP: go to declaration" }
	)

	-- LSP Diagnostics
	map(
		"n",
		"<leader>ldd",
		vim.diagnostic.open_float,
		{ desc = "LSP: diagnostics for line" }
	)
	map(
		"n",
		"<leader>ldD",
		"<cmd>Telescope diagnostics bufnr=0<cr>",
		{ desc = "LSP: diagnostics for file" }
	)
	map("n", "<leader>ldf", function()
		require("echo-diagnostics").echo_entire_diagnostic()
	end, { desc = "LSP: echo diagnostics" })

	-- Docs
	map(
		"n",
		"<leader>?",
		"<cmd>Lspsaga hover_doc<cr>",
		{ desc = "LSP: show documentation" }
	)

	-- Snippets
	map(
		"n",
		"<leader>+",
		"<cmd>Telescope luasnip<cr>",
		{ desc = "Code: snippets" }
	)
end

return M

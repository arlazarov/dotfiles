local M = {}

M.setup = function()
	local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local config = {
		virtual_text = false,
		signs = {
			active = signs,
		},
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
		maxwidth = 60,
	})
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
		maxwidth = 60,
	})
	-- Remove unwanted errors
	local function filter_tsserver_diagnostics(_, result, ctx, config)
		if result.diagnostics == nil then
			return
		end
		local idx = 1
		while idx <= #result.diagnostics do
			local entry = result.diagnostics[idx]
			if entry.code == 80001 then
				-- or entry.code == 6133 then
				table.remove(result.diagnostics, idx)
			else
				idx = idx + 1
			end
		end
		vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
	end
	vim.lsp.handlers["textDocument/publishDiagnostics"] = filter_tsserver_diagnostics

	require("lspconfig.ui.windows").default_options.border = "rounded"
	local echo_diagnostics = require("echo-diagnostics")
	echo_diagnostics.setup({
		show_diagnostic_number = true,
		show_diagnostic_source = false,
	})
	vim.api.nvim_create_autocmd({ "CursorHold" }, {
		callback = function()
			require("echo-diagnostics").echo_line_diagnostic()
		end,
	})
end

local function lsp_highlight_document(client)
	require("illuminate").on_attach(client)
end

local keymaps = require("plugins.lsp.config.keymaps")

M.on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
	if client.name == "tsserver" then
		client.server_capabilities.document_formatting = false
	end
	keymaps.map(bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return M

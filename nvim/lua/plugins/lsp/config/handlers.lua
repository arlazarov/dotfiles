local M = {}

local namespace = vim.api.nvim_create_namespace("lsp_diagnostics_custom")

vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰛨",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
	update_in_insert = false,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

vim.lsp.handlers["textDocument/hover"] = function(_, result, _, config)
	if not (result and result.contents) then
		return
	end
	local lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
	lines = vim.split(table.concat(lines, "\n"), "\n", { trimempty = true })
	if vim.tbl_isempty(lines) then
		return
	end
	config = vim.tbl_extend("force", config or {}, {
		border = "rounded",
		max_width = 80,
		focusable = false,
		focus_id = "hover",
	})
	vim.lsp.util.open_floating_preview(lines, "markdown", config)
end

vim.lsp.handlers["textDocument/signatureHelp"] = function(
	_,
	result,
	ctx,
	config
)
	if
		not result
		or not result.signatures
		or vim.tbl_isempty(result.signatures)
	then
		return
	end
	local active = result.activeSignature or 0
	local sig = result.signatures[active + 1] or result.signatures[1]
	if not sig or type(sig.label) ~= "string" or sig.label == "" then
		return
	end
	config = vim.tbl_extend("force", config or {}, {
		border = "rounded",
		max_width = 80,
		focusable = false,
		focus_id = "signature_help",
	})
	vim.lsp.util.open_floating_preview({ sig.label }, "plaintext", config)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(
	_,
	result,
	ctx,
	config
)
	if not result then
		return
	end
	local bufnr = ctx and ctx.bufnr
		or (result.uri and vim.uri_to_bufnr(result.uri))
	if not bufnr or not vim.api.nvim_buf_is_loaded(bufnr) then
		return
	end

	local diagnostics = {}
	for _, diag in ipairs(result.diagnostics or {}) do
		local r = diag.range
		if
			r
			and r.start
			and r["end"]
			and type(r.start.line) == "number"
			and type(r.start.character) == "number"
			and type(r["end"].line) == "number"
			and type(r["end"].character) == "number"
			and diag.code ~= 80001
		then
			table.insert(diagnostics, {
				lnum = r.start.line,
				col = r.start.character,
				end_lnum = r["end"].line,
				end_col = r["end"].character,
				severity = diag.severity,
				message = diag.message,
				source = diag.source,
				code = diag.code,
				user_data = diag.user_data,
			})
		end
	end

	vim.diagnostic.set(namespace, bufnr, diagnostics, config or {})
end

vim.lsp.handlers["textDocument/rename"] = function(err, result, _, _)
	if err then
		return
	end
	vim.lsp.util.apply_workspace_edit(result, "utf-8")
end

vim.lsp.handlers["textDocument/definition"] = function(_, result)
	if not result then
		return
	end
	local function jump(loc)
		local ok, err = pcall(function()
			return vim.lsp.util.show_document(loc, { focus = true })
		end)
		if not ok then
			vim.lsp.util.jump_to_location(loc, "utf-8")
		end
	end
	if vim.islist(result) and #result > 1 then
		jump(result[1])
		vim.fn.setqflist(vim.lsp.util.locations_to_items(result, "utf-8"))
		vim.cmd("copen")
	else
		jump(result)
	end
end

vim.lsp.handlers["textDocument/references"] = function(_, result)
	if not result or vim.tbl_isempty(result) then
		return
	end
	vim.fn.setqflist(vim.lsp.util.locations_to_items(result, "utf-8"))
	vim.cmd("copen")
end

vim.lsp.handlers["textDocument/codeAction"] = function(_, actions)
	if not actions or vim.tbl_isempty(actions) then
		return
	end
	vim.lsp.util._apply_code_action(actions[1])
end

require("lspconfig.ui.windows").default_options.border = "rounded"

require("echo-diagnostics").setup({
	show_diagnostic_number = true,
	show_diagnostic_source = false,
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		require("echo-diagnostics").echo_line_diagnostic()
	end,
})

local function setup_document_highlight(client, bufnr)
	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
	if pcall(require, "illuminate") then
		require("illuminate").on_attach(client)
	end
end

M.on_attach = function(client, bufnr)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
	if client.server_capabilities.inlayHintProvider then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	local ok, km = pcall(require, "plugins.lsp.config.keymaps")
	if ok then
		km.map(bufnr)
	end
	if client.name == "omnisharp" then
		client.server_capabilities.signatureHelpProvider = nil
	end
	setup_document_highlight(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return M

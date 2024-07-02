return {
	"VidocqH/lsp-lens.nvim",
	config = function()
		local SymbolKind = vim.lsp.protocol.SymbolKind

		require("lsp-lens").setup({
			enable = true,
			include_declaration = true,
			sections = {
				definition = true,
				references = true,
				implements = true,
				git_authors = false,
			},
			ignore_filetype = {
				"prisma",
			},
			target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
			wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
		})
	end,
}

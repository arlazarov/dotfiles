return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Completion source for LSP
		"folke/which-key.nvim", -- Keybinding hints
		"seblj/nvim-echo-diagnostics", -- Echo diagnostics in the command line
		{ "antosha417/nvim-lsp-file-operations", config = true }, -- File operations
		{ "folke/neodev.nvim", opts = {} }, -- Neovim dev setup
	},
	opts = {
		inlay_hints = { enabled = true }, -- Enable inlay hints
	},
	config = function()
		require("plugins.lsp.config.handlers").setup() -- Set up LSP handlers
		local lspconfig = require("lspconfig")
		local servers = {
			"lua_ls",
			"jsonls",
			"cssls",
			"tailwindcss",
			"tsserver",
			"bashls",
			"emmet_language_server",
			"eslint",
		}

		-- Ensure the servers are installed via mason-lspconfig
		require("mason-lspconfig").setup({ ensure_installed = servers })

		for _, server in pairs(servers) do
			local opts = {
				on_attach = require("plugins.lsp.config.handlers").on_attach,
				capabilities = require("plugins.lsp.config.handlers").capabilities,
			}

			-- Check for custom options for the server
			local has_custom_opts, server_custom_opts = pcall(require, "plugins.lsp.languages." .. server)
			if has_custom_opts then
				opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
			end

			-- Set up the server with the options
			lspconfig[server].setup(opts)
		end
	end,
}
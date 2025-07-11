return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"folke/which-key.nvim",
		"seblj/nvim-echo-diagnostics",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	opts = {
		inlay_hints = { enabled = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local handlers = require("plugins.lsp.config.handlers")

		local servers = {
			"cssls",
			"lua_ls",
			"jsonls",
			"ts_ls",
			"bashls",
			"emmet_language_server",
			"eslint",
			"omnisharp",
			"stylelint_lsp",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_installation = true,
			automatic_enable = true,
		})

		for _, server in ipairs(servers) do
			local opts = {
				on_attach = handlers.on_attach,
				capabilities = handlers.capabilities,
			}

			local ok, custom_opts =
				pcall(require, "plugins.lsp.languages." .. server)
			if ok then
				opts = vim.tbl_deep_extend("force", opts, custom_opts)
			end

			if not lspconfig[server] then
				vim.notify(
					"LSP server not found: " .. server,
					vim.log.levels.ERROR
				)
			else
				lspconfig[server].setup(opts)
			end
		end
	end,
}

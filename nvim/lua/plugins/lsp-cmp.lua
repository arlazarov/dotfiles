return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"glepnir/lspsaga.nvim",
		"octaltree/cmp-look",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Lazy load VSCode-style snippets
		require("luasnip.loaders.from_vscode").lazy_load()

		-- Custom border style for completion and documentation windows
		local borderstyle = {
			winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
			border = "rounded",
			max_width = 50,
			min_width = 50,
			max_height = math.floor(vim.o.lines * 0.4),
			min_height = 3,
		}

		-- Setup nvim-cmp
		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			matching = {
				disallow_fuzzy_matching = true,
				disallow_fullfuzzy_matching = true,
				disallow_partial_fuzzy_matching = false,
				disallow_partial_matching = false,
				disallow_prefix_unmatching = true,
			},
			sorting = {
				priority_weight = 1.0,
				comparators = {
					cmp.config.compare.locality,
					cmp.config.compare.recently_used,
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.order,
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-space>"] = cmp.mapping.complete({ select = true }),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 50 },
				{ name = "cmp_tabnine", priority = 90 },
				{ name = "luasnip", priority = 100 },
				{ name = "path", priority = 99 },
				{ name = "buffer", priority = 50, keyword_length = 1, max_item_count = 5 },
				{ name = "nvim_lsp_signature_help", priority = 50 },
				{
					name = "look",
					priority = 50,
					keyword_length = 5,
					max_item_count = 5,
					option = {
						convert_case = true,
						loud = true,
					},
				},
			}),
			duplicates = {
				nvim_lsp = 1,
				luasnip = 1,
				buffer = 1,
				path = 1,
			},
			window = {
				documentation = borderstyle,
				completion = borderstyle,
			},
			experimental = {
				ghost_text = true,
			},
			view = {
				entries = "custom",
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local lspkind_icons = {
						Text = "",
						Method = "",
						Function = "󰊕",
						Constructor = "󰡱",
						Field = "",
						Variable = "",
						Class = "",
						Interface = "",
						Module = "",
						Property = "",
						Unit = "",
						Value = "",
						Enum = "",
						Keyword = "",
						Snippet = "",
						Color = "",
						File = "",
						Reference = "",
						Folder = "",
						EnumMember = "",
						Constant = "",
						Struct = "",
						Event = "",
						Operator = "",
						TypeParameter = " ",
						Robot = "󱚤",
						Roboti = "󱨚",
						Smiley = " ",
						Note = " ",
					}

					-- Load lspkind icons
					vim_item.kind = lspkind_icons[vim_item.kind]

					-- Custom icon for Tabnine with color setting
					if entry.source.name == "cmp_tabnine" then
						vim_item.kind = "⚡" -- Set Tabnine icon to lightning bolt
						vim_item.kind_hl_group = "CmpItemKindTabnine"
					end

					-- Custom icon for 'look'
					if entry.source.name == "look" then
						vim_item.kind = lspkind_icons["Note"]
					end

					-- Menu label for each source
					vim_item.menu = ({
						buffer = "[Buffer]",
						nvim_lsp = "[LSP]",
						path = "[Path]",
						luasnip = "[LuaSnip]",
						cmp_tabnine = "[TabNine]",
						latex_symbols = "[LaTeX]",
						nvim_lua = "[Lua]",
						look = "[Dict]",
					})[entry.source.name]

					return vim_item
				end,
			},
		})

		-- Set color for Tabnine icon
		vim.cmd([[highlight! CmpItemKindTabnine guifg=#FF5733 guibg=NONE]])

		-- Disable cmp for TelescopePrompt
		cmp.setup.filetype({ "TelescopePrompt" }, {
			sources = {},
		})

		-- Custom source for specific filetypes
		cmp.setup.filetype({ "vim", "markdown" }, {
			sources = {
				{
					name = "look",
					keyword_length = 5,
					max_item_count = 5,
					option = {
						convert_case = true,
						loud = true,
					},
				},
			},
		})
	end,
}

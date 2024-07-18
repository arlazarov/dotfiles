return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ryanoasis/vim-devicons",
		"folke/which-key.nvim",
	},
	config = function()
		local api = require("nvim-tree.api")

		-- Keybinding to toggle nvim-tree
		vim.keymap.set("n", "<Tab>", api.tree.toggle, { desc = "toggle" })

		-- Setup which-key for nvim-tree
		require("which-key").add({
			{
				"<leader>e",
				function()
					vim.cmd("cd %:p:h")
					vim.cmd("pwd")
					api.tree.toggle({
						path = vim.fn.expand("%:p:h"),
						find_file = true,
					})
				end,
				desc = "Nvim-tree: setup",
			},
		})

		-- Custom keybindings for nvim-tree
		local function my_on_attach(bufnr)
			local function sets(desc)
				return {
					desc = "Nvim-tree: " .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end

			api.config.mappings.default_on_attach(bufnr)
			vim.keymap.set("n", "<Tab>", api.tree.toggle, sets("toggle"))
			vim.keymap.set("n", "<CR>", api.node.open.preview, sets("edit"))
			vim.keymap.set("n", "s", api.node.open.horizontal, sets("split"))
			vim.keymap.set("n", "v", api.node.open.vertical, sets("vSplit"))
			vim.keymap.set("n", "p", api.tree.change_root_to_parent, sets("up"))
			vim.keymap.set(
				"n",
				"gm",
				api.marks.bulk.move,
				sets("move bookmarked")
			)
			vim.keymap.set(
				"n",
				"c",
				api.tree.collapse_all,
				sets("collapse all")
			)
		end

		-- Disable netrw
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- Setup nvim-tree with custom configurations
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			disable_netrw = true,
			hijack_cursor = true,
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			renderer = {
				highlight_opened_files = "none",
				highlight_git = false,
				add_trailing = false,
				root_folder_modifier = ":t",
				indent_markers = {
					enable = true,
					inline_arrows = true,
					icons = {
						none = " ",
						corner = "╚",
						edge = "║",
						item = "╠",
					},
				},
				icons = {
					webdev_colors = true,
					git_placement = "after",
					padding = " ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "✐",
							untracked = "○",
							deleted = "⊖",
							ignored = "◌",
						},
					},
				},
			},
			filters = {
				dotfiles = true,
				custom = { "node_modules" },
				exclude = {},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				icons = {
					error = "",
					warning = "",
					hint = "󰛨",
					info = "",
				},
			},
			git = {
				enable = true,
				ignore = true,
				show_on_dirs = true,
				timeout = 400,
			},
			view = {
				centralize_selection = false,
				width = 30,
				side = "left",
				preserve_window_proportions = true,
			},
			log = {
				enable = true,
				truncate = true,
				types = {
					diagnostics = true,
				},
			},
		})
	end,
}

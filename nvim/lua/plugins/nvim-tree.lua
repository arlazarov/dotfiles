return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"ryanoasis/vim-devicons",
		"folke/which-key.nvim",
	},
	config = function()
		local api = require("nvim-tree.api")

		-- Toggle с <Tab>
		vim.keymap.set(
			"n",
			"<Tab>",
			api.tree.toggle,
			{ desc = "Toggle NvimTree" }
		)

		require("which-key").add({
			{
				"<leader>e",
				function()
					vim.cmd("cd %:p:h")
					vim.cmd("pwd")
					api.tree.toggle({
						path = vim.fn.expand("%:p:h"),
						find_file = false,
					})
				end,
				desc = "Nvim-tree: setup",
			},
		})

		local function my_on_attach(bufnr)
			local function opts(desc)
				return {
					desc = "NvimTree: " .. desc,
					buffer = bufnr,
					noremap = true,
					silent = true,
					nowait = true,
				}
			end

			api.config.mappings.default_on_attach(bufnr)

			vim.keymap.set("n", "<Tab>", api.tree.toggle, opts("Toggle"))
			vim.keymap.set(
				"n",
				"<CR>",
				api.node.open.preview,
				opts("Preview file")
			)
			vim.keymap.set("n", "s", api.node.open.horizontal, opts("Split"))
			vim.keymap.set("n", "v", api.node.open.vertical, opts("VSplit"))
			vim.keymap.set("n", "p", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set(
				"n",
				"c",
				api.tree.collapse_all,
				opts("Collapse all")
			)
			vim.keymap.set(
				"n",
				"gm",
				api.marks.bulk.move,
				opts("Bulk Move Marked Files")
			)
		end

		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			disable_netrw = true,
			hijack_cursor = true,
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					webdev_colors = true,
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
				},
			},
			filters = {
				dotfiles = true,
				custom = { "node_modules" },
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			git = {
				enable = true,
				ignore = true,
				show_on_dirs = true,
			},
			view = {
				width = 30,
				side = "left",
				preserve_window_proportions = true,
			},
		})
	end,
}

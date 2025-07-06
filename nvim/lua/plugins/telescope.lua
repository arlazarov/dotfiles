return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
		"folke/noice.nvim",
		"folke/trouble.nvim",
		"folke/which-key.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"nvim-lua/popup.nvim",
		"ribelo/taskwarrior.nvim",
		-- "ElPiloto/telescope-vimwiki.nvim",
		{
			"benfowler/telescope-luasnip.nvim",
			module = "telescope._extensions.luasnip",
		},
		"nvim-telescope/telescope-frecency.nvim",
		"tami5/sqlite.lua",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local trouble = require("trouble.sources.telescope")
		local transform_mod = require("telescope.actions.mt").transform_mod

		-- Custom actions
		local custom_actions = transform_mod({
			open_trouble_qflist = function()
				trouble.open("quickfix")
			end,
		})

		-- Telescope setup
		telescope.setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				find_command = {
					"fd",
					"--type",
					"file",
					"--hidden",
					"--follow",
					"--exclude",
					".git",
				},
				file_ignore_patterns = {
					"node_modules",
					".git/",
				},
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist
							+ custom_actions.open_trouble_qflist,
						["<C-t>"] = trouble.open,
					},
				},
			},
			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "webp", "jpg", "jpeg", "pdf" },
					-- find command (defaults to `fd`)
					find_cmd = "rg",
				},
			},
		})

		-- Load extensions
		telescope.load_extension("fzf")
		telescope.load_extension("noice")
		telescope.load_extension("luasnip")
		telescope.load_extension("frecency")
		telescope.load_extension("media_files")

		vim.keymap.set("n", "<leader>f", "<nop>", { desc = "Telescope" })

		vim.keymap.set(
			"n",
			"<leader>fl",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ desc = "Find in current buffer" }
		)
		vim.keymap.set(
			"n",
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			{ desc = "Find files" }
		)
		vim.keymap.set(
			"n",
			"<leader>fr",
			"<cmd>Telescope oldfiles<cr>",
			{ desc = "Find recent files" }
		)
		vim.keymap.set(
			"n",
			"<leader>fs",
			"<cmd>Telescope live_grep<cr>",
			{ desc = "Search in workspace" }
		)
		vim.keymap.set(
			"n",
			"<leader>fc",
			"<cmd>Telescope grep_string<cr>",
			{ desc = "Search under cursor" }
		)
		vim.keymap.set(
			"n",
			"<leader>ft",
			"<cmd>TodoTelescope<cr>",
			{ desc = "Find todos" }
		)
		vim.keymap.set(
			"n",
			"<leader>fg",
			"<cmd>Telescope spell_suggest<cr>",
			{ desc = "Find files" }
		)
		vim.keymap.set(
			"n",
			"<leader>f.",
			"<cmd>Telescope lsp_document_symbols<cr>",
			{ desc = "Find files" }
		)
		vim.keymap.set(
			"n",
			"<leader>fe",
			"<cmd>Telescope frecency<cr>",
			{ desc = "Find frequently used files" }
		)
	end,
}

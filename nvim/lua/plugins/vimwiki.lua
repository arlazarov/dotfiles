return {
	"vimwiki/vimwiki",
	branch = "dev",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/Vault/",
				syntax = "markdown",
				ext = ".md",
			},
			{
				path = "~/GG Freight Services/",
				syntax = "markdown",
				ext = ".md",
			},
		}
		vim.g.vimwiki_ext2syntax = {
			[".md"] = "markdown",
			[".markdown"] = "markdown",
			[".mdown"] = "markdown",
		}

		vim.g.vimwiki_global_ext = 0
		vim.g.vimwiki_folding = "custom"
		vim.g.vimwiki_hl_headers = 1
		vim.g.vimwiki_headers_level = 2
		-- vim.g.vimwiki_markdown_link_ext = 1
		vim.g.taskwiki_markdown_syntax = "markdown"
		vim.g.indentLine_conceallevel = 3
		vim.g.vimwiki_auto_chdir = 1
		vim.g.vimwiki_date_format = "%Y-%m-%d"
		vim.g.vimwiki_auto_toc = 1
		vim.g.vimwiki_auto_header = 0
		vim.g.vimwiki_autocomplete_syntax = 1
		vim.g.vimwiki_folding_level = 3
		vim.g.vimwiki_map_prefix = "<leader>w"
		vim.g.vimwiki_camel_case = 0
		vim.g.vimwiki_table_auto_fmt = 1
		vim.g.vimwiki_use_calendar = 0
		vim.treesitter.language.register("markdown", "vimwiki")
		vim.g.vimwiki_listsyms = " x"
		vim.g.vimwiki_key_mappings = {
			all_maps = 1,
			global = 1,
			headers = 1,
			text_objs = 1,
			table_format = 1,
			table_mappings = 1,
			lists = 1,
			links = 0,
			html = 1,
			mouse = 0,
			diary = 0,
			markdown = 1,
			tag_markers = 1,
			spaces = 1,
			tabs = 0,
		}

		vim.keymap.set("n", "<leader>w", "", { desc = "VimWiki" })

		vim.keymap.set(
			"n",
			"<leader>tt",
			":VimwikiToggleListItem<CR>",
			{ desc = "Task toggle" }
		)
	end,
}

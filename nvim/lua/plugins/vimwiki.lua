return {
	"vimwiki/vimwiki",
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/.config/nvim/vimwiki/",
				syntax = "markdown",
				ext = ".md",
			},
		}
		vim.g.vimwiki_auto_chdir = 1
		vim.g.vimwiki_date_format = "%Y-%m-%d"
		vim.g.vimwiki_auto_toc = 1
		vim.g.vimwiki_headers_level = 2
		vim.g.vimwiki_autocomplete_syntax = 1
		vim.g.vimwiki_markdown_link_ext = 1

		vim.g.vimwiki_map_prefix = "<leader>w"
		vim.g.vimwiki_camel_case = 0
		vim.g.vimwiki_table_auto_fmt = 1
		vim.g.vimwiki_use_calendar = 1

		-- Key mapping for toggling list items_number
		require("which-key").add({
			{ "<leader>w", group = "VimWiki" },
			{
				hidden = true,
				{
					"<leader>tt",
					":VimwikiToggleListItem<CR>",
				},
			},
		})
	end,
}

return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({
			providers = {
				"lsp",
				"treesitter",
				"regex",
			},
			delay = 400,
			filetypes_denylist = {
				"dirbuf",
				"dirvish",
				"fugitive",
			},
			filetypes_allowlist = {},
			modes_denylist = {},
			modes_allowlist = {},
			providers_regex_syntax_denylist = {},
			providers_regex_syntax_allowlist = {},
			under_cursor = true,
			large_file_cutoff = 2000,
			large_file_overrides = {
				providers = { "lsp" },
			},
			min_count_to_highlight = 1,
			case_insensitive_regex = false,
		})
	end,
}

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "wiki", "vimwiki", "markdown", "norg" }
		vim.g.mkdp_markdown_css =
			vim.fn.expand("~/.config/nvim/vimwiki/markdown2.css")
	end,
	ft = { "markdown" },
}

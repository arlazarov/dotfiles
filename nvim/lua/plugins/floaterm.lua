return {
	"voldikss/vim-floaterm",
	event = "VeryLazy",
	config = function()
		local map = vim.keymap
		local opts = { noremap = true, silent = true }
		map.set({ "n", "v" }, "<C-t>", ":FloatermToggle<CR>", opts)
		map.set("t", "<C-t>", "<C-\\><C-n>:FloatermToggle<CR>", opts)
		map.set("t", "<C-o>", "<C-\\><C-n>:FloatermNew<CR>", opts)
		map.set("t", "<C-k>", "<C-\\><C-n>:FloatermKill<cr>", opts)
		map.set("t", "<C-a>", "<C-\\><C-n>:FloatermKill<cr>:FloatermNext<CR>", opts)
		map.set("t", "<C-p>", "<C-\\><C-n>:FloatermPrev<CR>", opts)
		map.set("t", "<C-n>", "<C-\\><C-n>:FloatermNext<CR>", opts)
		map.set("t", "<C-s>", "<C-\\><C-n>:FloatermUpdate --height=0.99 --width=0.45<CR>", opts)
		map.set("t", "<C-f>", "<C-\\><C-n>:FloatermUpdate --height=0.99 --width=0.99<CR>", opts)
		map.set("t", "<C-d>", "<C-\\><C-n>:FloatermUpdate --height=0.6 --width=0.6<CR>", opts)
	end,
}

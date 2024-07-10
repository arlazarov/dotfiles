local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Map <C-c> to <ESC> in insert mode
map("i", "<C-c>", "<ESC>", opts)

-- Disable error messages for 'n' and 'N' search command
local function norm_unmapped(c)
	return vim.cmd({ cmd = "norm", args = { c }, bang = true })
end
map("n", "n", function()
	pcall(norm_unmapped, "n")
end, opts)
map("n", "N", function()
	pcall(norm_unmapped, "N")
end, opts)

-- Terminal mode
map("t", "<Esc>", "<C-\\><C-n>", opts) -- Exit terminal mode

-- Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", opts) -- Unbind Space
map({ "n", "x" }, "Q", "<nop>", opts) -- Unbind Q

-- Insert mode
map("i", "jk", "<ESC>", opts) -- jk to exit insert mode
map("i", "<C-l>", "<Del>", opts) -- Ctrl+l to delete character

-- Normal mode
map("n", "<backspace><backspace>", '<cmd>bdelete!"<cr>', opts) -- Delete buffer
map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true }) -- Wrap text movement
map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true }) -- Wrap text movement
map("n", "<C-n>", "<cmd>cnext<CR>", opts) -- Quickfix next
map("n", "<C-p>", "<cmd>cprev<CR>", opts) -- Quickfix prev
map("n", "<leader>Y", [["+Y]], opts) -- Copy line to clipboard
map("n", "vv", "`[v`]", opts) -- Reselect pasted text
map("n", "YY", "va{Vy", opts) -- Select inside {}
map("n", "YA", "<cmd>%y<cr>", opts) -- Select all text
map("n", "gR", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>]], opts) -- Search and replace
map("n", "gr", [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>]], opts) -- Search and replace

-- Normal and Visual modes
map({ "n", "x" }, "<leader>y", [["+y]], opts) -- Copy to clipboard
map({ "n", "x" }, "<leader>p", [["+p]], opts) -- Paste from clipboard

-- Setup which-key for additional mappings
require("which-key").register({
	b = {
		name = "Buffer",
		c = { "<cmd>bdelete!<cr>", "Buffer: close" },
		k = { "<cmd>%bd|e#<cr>", "Buffer: close all" },
		n = { "<cmd>bnext<cr>", "Buffer: next" },
		p = { "<cmd>bprevious<cr>", "Buffer: previous" },
	},
	H = { "<cmd>nohl<cr>", "No highlight" },
}, {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	silent = true,
	noremap = true,
	nowait = true,
})

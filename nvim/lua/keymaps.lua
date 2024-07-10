local map = vim.keymap.set
local apimap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

apimap("i", "<C-c>", "<ESC>", opts)

-- Disable error messages for 'n' and 'N'  search command
local function norm_unmapped(c)
	return vim.cmd({ cmd = "norm", args = { c }, bang = true })
end

vim.keymap.set("n", "n", function()
	pcall(norm_unmapped, "n")
end)
vim.keymap.set("n", "N", function()
	pcall(norm_unmapped, "N")
end)
vim.cmd([[nnoremap / :silent! /]])

-- Terminal mode
map("t", "<Esc>", "<C-\\><C-n>", opts) -- Exit terminal mode

-- Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", opts) -- Unbind Space
map({ "n", "x" }, "Q", "<nop>") -- Unbind Q

-- Insert mode
map("i", "jk", "<ESC>", opts) -- jk to exit insert mode
map("i", "<C-l>", "<Del>", opts) -- Ctrl+l to delete character

-- Normal mode
map("n", "<backspace><backspace>", '<cmd>bdelete!"<cr>', opts) -- Delete buffer
map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true }) -- Wrap text movement
map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true }) -- Wrap text movement
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
	t = {
		name = "Tabs",
		o = { "<cmd>tabs<cr>", "Tab: New" },
		a = { "<cmd>tabnew<cr>", "Tab: New" },
		e = { "<cmd>tabedit %<cr>", "Tab: New" },
		c = { "<cmd>tabclose<cr>", "Tab: Close" },
		k = { "<cmd>tabonly<cr>", "Tab: Close all but current" },
		n = { "<cmd>tabnext<cr>", "Tab: Next" },
		p = { "<cmd>tabprevious<cr>", "Tab: Previous" },
	},
	H = { "<cmd>nohl<cr>", "No highlight" },
}, {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	silent = true,
	noremap = true,
	nowait = true,
})
apimap("n", "<C-M-l>", "<cmd>tabnext<cr>", { noremap = true, silent = true })
apimap(
	"n",
	"<C-M-h>",
	"<cmd>tabprevious<cr>",
	{ noremap = true, silent = true }
)
apimap(
	"n",
	"<S-C-M-l>",
	"<cmd>tabmove +1<cr>",
	{ noremap = true, silent = true }
)
apimap(
	"n",
	"<S-C-M-h>",
	"<cmd>tabmove -1<cr>",
	{ noremap = true, silent = true }
)

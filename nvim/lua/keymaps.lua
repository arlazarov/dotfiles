local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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
map("i", "<C-c>", "<ESC>", opts) -- Rebind C-c
map("t", "<Esc>", "<C-\\><C-n>", opts) -- Exit terminal mode
map({ "n", "v" }, "<Space>", "<Nop>", opts) -- Unbind Space
map({ "n", "x" }, "Q", "<nop>", opts) -- Unbind Q

map("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true })
map("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true })

-- Move line
vim.api.nvim_set_keymap(
	"n",
	"<A-j>",
	":m .+1<CR>==",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"n",
	"<A-k>",
	":m .-2<CR>==",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"i",
	"<A-j>",
	"<Esc>:m .+1<CR>==gi",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"i",
	"<A-k>",
	"<Esc>:m .-2<CR>==gi",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"v",
	"<A-j>",
	":m '>+1<CR>gv=gv",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
	"v",
	"<A-k>",
	":m '<-2<CR>gv=gv",
	{ noremap = true, silent = true }
)

-- Setup which-key for additional mappings
require("which-key").add({
	-- Normal and Visual modes
	{
		mode = { "n", "x" },
		hidden = true,
		{ "<leader>y", [["+y]] }, -- Copy to clipboard
		{ "<leader>p", [["+p]] }, -- Paste from clipboard
	},
	-- Insert mode
	{
		mode = { "i" },
		{ "jk", "<ESC>" }, -- jk to exit insert mode
		{ "<C-l>", "<Del>" }, -- Ctrl+l to delete character
	},
	-- Normal mode
	{ "<backspace><backspace>", '<cmd>bdelete!"<cr>' }, -- Delete buffer
	{ "<C-n>", "<cmd>cnext<CR>" }, -- Quickfix next
	{ "<C-p>", "<cmd>cprev<CR>" }, -- Quickfix prev
	{ "vv", "`[v`]" }, -- Reselect pasted text
	{ "YY", "va{Vy" }, -- Select inside {}
	{ "YA", "<cmd>%y<cr>" }, -- Select all text
	{ "gR", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>]] }, -- Search and replace
	{ "gr", [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>]] }, -- Search and replace
	{
		hidden = true,
		{ "<leader><cr>", "" },
		{ "<leader>Y", [["+Y]], desc = "Copy line" }, -- Copy line to clipboard
	},
	-- Buffer
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bc", "<cmd>bdelete!<cr>", desc = "Buffer: close" },
	{ "<leader>bk", "<cmd>%bd|e#<cr>", desc = "Buffer: close all" },
	{ "<leader>bn", "<cmd>bnext<cr>", desc = "Buffer: next" },
	{ "<leader>bp", "<cmd>bprevious<cr>", desc = "Buffer: previous" },
	-- Set
	{ "<leader>s", group = "Set" },
	{ "<leader>ss", "<cmd>set spell!<cr>", desc = "Set: spell toggle" },
	{ "<leader>sh", "<cmd>nohl<cr>", desc = "No highlight" },
})

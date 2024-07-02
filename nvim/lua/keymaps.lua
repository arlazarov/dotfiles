local map = vim.keymap.set
local opts = { noremap = true, silent = true }

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
map("n", "<leader>vp", "`[v`]", opts) -- Reselect pasted text
map("n", "YY", "va{Vy", opts) -- Select inside {}
map("n", "YA", "<cmd>%y<cr>", opts) -- Select all text
map("n", "gR", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>]], opts) -- Search and replace
map("n", "gr", [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>]], opts) -- Search and replace

-- Normal and Visual modes
map({ "n", "x" }, "<leader>y", [["+y]], opts) -- Copy to clipboard
map({ "n", "x" }, "<leader>p", [["+p]], opts) -- Paste from clipboard

-- Setup which-key for additional mappings
require("which-key").register({
	w = {
		name = "Window",
		s = { "<c-w>s", "Split" },
		v = { "<c-w>v", "vSplit" },
		c = { "<cmd>close<cr>", "Close" },
		["="] = { "<C-w>=", "Equal" },
	},
	t = {
		name = "Tab",
		n = { "<cmd>tabnew<cr>", "New" },
		c = { "<cmd>tabclose<cr>", "Close" },
		l = { "<cmd>tabn<cr>", "Next" },
		h = { "<cmd>tabp<cr>", "Prev" },
		m = { "<cmd>tabnew %<cr>", "Move" },
	},
	b = {
		name = "Buffer",
		c = { "<cmd>bdelete!<cr>", "Close" },
		k = { "<cmd>%bd|e#<cr>", "Close all" },
		l = { "<cmd>bnext<cr>", "Next" },
		h = { "<cmd>bprevious<cr>", "Prev" },
	},
	o = {
		name = "Other",
		s = { "<cmd>setlocal spell!<cr>", "Spell" },
		n = { "<cmd>set number!<cr>", "Number" },
		h = { "<cmd>nohl<cr>", "No highlight" },
		["+"] = { "<c-a>", "Inc" },
		["-"] = { "<c-x>", "Dec" },
	},
	H = { "<cmd>nohl<cr>", "No highlight" },
}, {
	mode = "n", -- Normal mode
	prefix = "<leader>",
	silent = true,
	noremap = true,
	nowait = true,
})

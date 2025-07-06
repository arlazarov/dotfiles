local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Search without error messages
map("n", "n", function()
	pcall(vim.cmd.normal, "n")
end, vim.tbl_extend("force", opts, { desc = "Search next (no error)" }))
map("n", "N", function()
	pcall(vim.cmd.normal, "N")
end, vim.tbl_extend("force", opts, { desc = "Search prev (no error)" }))

-- Terminal & Insert mode enhancements
map(
	"i",
	"<C-c>",
	"<ESC>",
	vim.tbl_extend("force", opts, { desc = "Escape insert mode" })
)
map(
	"t",
	"<Esc>",
	"<C-\\><C-n>",
	vim.tbl_extend("force", opts, { desc = "Escape terminal mode" })
)
map(
	{ "n", "v" },
	"<Space>",
	"<Nop>",
	vim.tbl_extend("force", opts, { desc = "Disable <Space>" })
)
map(
	{ "n", "x" },
	"Q",
	"<nop>",
	vim.tbl_extend("force", opts, { desc = "Disable Q" })
)

-- Smarter vertical movement
map(
	"n",
	"k",
	'v:count == 0 ? "gk" : "k"',
	{ expr = true, noremap = true, desc = "Move up (smart)" }
)
map(
	"n",
	"j",
	'v:count == 0 ? "gj" : "j"',
	{ expr = true, noremap = true, desc = "Move down (smart)" }
)

-- Move lines
map(
	"n",
	"<A-j>",
	":m .+1<CR>==",
	vim.tbl_extend("force", opts, { desc = "Move line down" })
)
map(
	"n",
	"<A-k>",
	":m .-2<CR>==",
	vim.tbl_extend("force", opts, { desc = "Move line up" })
)
map(
	"i",
	"<A-j>",
	"<Esc>:m .+1<CR>==gi",
	vim.tbl_extend("force", opts, { desc = "Move line down (insert)" })
)
map(
	"i",
	"<A-k>",
	"<Esc>:m .-2<CR>==gi",
	vim.tbl_extend("force", opts, { desc = "Move line up (insert)" })
)
map(
	"v",
	"<A-j>",
	":m '>+1<CR>gv=gv",
	vim.tbl_extend("force", opts, { desc = "Move block down" })
)
map(
	"v",
	"<A-k>",
	":m '<-2<CR>gv=gv",
	vim.tbl_extend("force", opts, { desc = "Move block up" })
)

-- System clipboard
map(
	{ "n", "x" },
	"<leader>y",
	[["+y]],
	vim.tbl_extend("force", opts, { desc = "Yank to clipboard" })
)
map(
	{ "n", "x" },
	"<leader>p",
	[["+p]],
	vim.tbl_extend("force", opts, { desc = "Paste from clipboard" })
)
map(
	"n",
	"<leader>Y",
	[["+Y]],
	vim.tbl_extend("force", opts, { desc = "Yank line to clipboard" })
)

-- Insert mode shortcuts
map(
	"i",
	"jk",
	"<ESC>",
	vim.tbl_extend("force", opts, { desc = "Escape insert (jk)" })
)
map(
	"i",
	"<C-l>",
	"<Del>",
	vim.tbl_extend("force", opts, { desc = "Delete forward (insert)" })
)

-- Buffer control
map(
	"n",
	"<leader>bc",
	"<cmd>bdelete!<cr>",
	vim.tbl_extend("force", opts, { desc = "Close buffer" })
)
map(
	"n",
	"<leader>bk",
	"<cmd>%bd|e#<cr>",
	vim.tbl_extend("force", opts, { desc = "Kill all buffers but current" })
)
map(
	"n",
	"<leader>bn",
	"<cmd>bnext<cr>",
	vim.tbl_extend("force", opts, { desc = "Next buffer" })
)
map(
	"n",
	"<leader>bp",
	"<cmd>bprevious<cr>",
	vim.tbl_extend("force", opts, { desc = "Previous buffer" })
)

-- Misc
map(
	"n",
	"<backspace><backspace>",
	"<cmd>bdelete!<cr>",
	vim.tbl_extend("force", opts, { desc = "Close buffer (BS)" })
)
map(
	"n",
	"<C-n>",
	"<cmd>cnext<CR>",
	vim.tbl_extend("force", opts, { desc = "Quickfix next" })
)
map(
	"n",
	"<C-p>",
	"<cmd>cprev<CR>",
	vim.tbl_extend("force", opts, { desc = "Quickfix previous" })
)
map(
	"n",
	"vv",
	"`[v`]",
	vim.tbl_extend("force", opts, { desc = "Select last paste" })
)
map(
	"n",
	"YY",
	"va{Vy",
	vim.tbl_extend("force", opts, { desc = "Yank inside braces" })
)
map(
	"n",
	"YA",
	"<cmd>%y<cr>",
	vim.tbl_extend("force", opts, { desc = "Yank entire buffer" })
)
map(
	"n",
	"gR",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	vim.tbl_extend("force", opts, { desc = "Replace word in buffer" })
)
map(
	"n",
	"gr",
	[[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	vim.tbl_extend("force", opts, { desc = "Replace word to EOF" })
)
map(
	"n",
	"<leader>s",
	"<Nop>",
	{ noremap = true, silent = true, desc = "󰛔 Settings" }
)
map(
	"n",
	"<leader>ss",
	"<cmd>set spell!<cr>",
	vim.tbl_extend("force", opts, { desc = "Toggle spellcheck" })
)
map(
	"n",
	"<leader>sh",
	"<cmd>nohl<cr>",
	vim.tbl_extend("force", opts, { desc = "Clear search highlight" })
)

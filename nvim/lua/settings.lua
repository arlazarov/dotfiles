vim.g.mapleader = " "
local set = vim.opt

-- General settings
set.backup = false
set.swapfile = false
set.clipboard:append("unnamedplus")
set.number = true
set.termguicolors = true
set.updatetime = 250
set.mouse = ""
set.directory = "~/.config/nvim/tmp//"
set.title = true
set.encoding = "utf-8"
set.belloff = "all"
set.hidden = true
set.ttimeoutlen = 0
set.ttyfast = true
set.cmdheight = 2
set.autoread = true
set.wildmenu = true
set.spell = false
set.background = "dark"

-- Indentation
set.tabstop = 2
set.ts = 2
set.sw = 2
set.sts = 2
set.expandtab = true
set.smarttab = true
set.autoindent = true
set.smartindent = true
set.cindent = true

-- Search
set.incsearch = true
set.hlsearch = true
set.ignorecase = true
set.smartcase = true

-- UI settings
set.splitbelow = true
set.splitright = true
set.pumblend = 0
set.list = true
set.listchars = "tab:  ,trail:×,nbsp:.,extends:#"
set.fillchars = "eob: ,fold: ,vert: "
set.colorcolumn = "80"
set.cursorline = true
set.signcolumn = "yes"
set.termguicolors = true

-- Miscellaneous
set.regexpengine = 1
set.synmaxcol = 200
set.linebreak = true
set.backspace = "indent,eol,start"

-- Commands
vim.api.nvim_command("set nomodeline")
vim.api.nvim_command("set nofoldenable")
vim.api.nvim_command("set completeopt=preview")
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")

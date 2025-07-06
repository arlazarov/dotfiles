vim.api.nvim_set_hl(0, "CursorLine", { bg = "#111111" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#111111", fg = "yellow" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#333333" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#111111" })

vim.api.nvim_set_hl(0, "MatchParen", { bg = "#333333" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", fg = "#FFFFFF" })
vim.api.nvim_set_hl(0, "NotifyBackground", { bg = "#111111" })
vim.api.nvim_set_hl(0, "LspInfoBorder", { fg = "#FFFFFF" })

vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "none", fg = "red" })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { bg = "none", fg = "yellow" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { link = "DiagnosticHint" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { bg = "none", fg = "green" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { bg = "none", fg = "yellow" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { link = "DiagnosticWarn" })

vim.api.nvim_set_hl(0, "Simon", { bg = "#1e2718" })

vim.api.nvim_set_hl(0, "debugBreakpoint", { bg = "none", fg = "red" })

vim.api.nvim_set_hl(0, "Folded", { bg = "" })
vim.api.nvim_set_hl(0, "Undelined", { bg = "", underline = false })
vim.api.nvim_set_hl(0, "Headline1", { bg = "#1e2718" })
vim.api.nvim_set_hl(0, "Headline2", { bg = "#21262d" })
vim.api.nvim_set_hl(0, "Headline3", { bg = "#1e1718" })
vim.api.nvim_set_hl(0, "Headline4", { bg = "#1A1A1A" })
vim.api.nvim_set_hl(0, "CodeBlock", { bg = "#1A1A1A" })
vim.api.nvim_set_hl(0, "Quote", { fg = "#0099EC" })
vim.api.nvim_set_hl(0, "Dash", { fg = "#D19A66", bold = true })

vim.api.nvim_set_hl(0, "VimwikiWeblink1", { fg = "#89ddff", underline = false })
vim.api.nvim_set_hl(
	0,
	"@markup.link.markdown_inline",
	{ fg = "#89ddff", underline = false }
)
vim.api.nvim_set_hl(
	0,
	"@markup.link.url.markdown_inline",
	{ fg = "#89ddff", underline = false }
)
vim.api.nvim_set_hl(0, "ObsidianRefText", { fg = "#89ddff", underline = false })

vim.cmd("highlight! link SignColumn LineNr")
vim.cmd("autocmd InsertEnter * hi CursorLine guibg=#333333")
vim.cmd("autocmd InsertEnter * hi CursorLineNr guibg=#333333")
vim.cmd("autocmd InsertLeave * hi CursorLine guibg=#111111")
vim.cmd("autocmd InsertLeave * hi CursorLineNr guibg=#111111")

-- Illuminant
vim.api.nvim_create_augroup("IlluminateGroup", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "BufRead", "BufNewFile" }, {
	group = "IlluminateGroup",
	callback = function()
		require("illuminate").on_attach()
	end,
})
-- Check for file update
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
	callback = function()
		vim.api.nvim_command("checktime")
	end,
})
-- Disable diagnostics in insert mode
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = { "n:i", "v:s" },
	desc = "Disable diagnostics in insert and select mode",
	callback = function(e)
		vim.diagnostic.disable(e.buf)
	end,
})
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "i:n",
	desc = "Enable diagnostics when leaving insert mode",
	callback = function(e)
		vim.diagnostic.enable(e.buf)
	end,
})

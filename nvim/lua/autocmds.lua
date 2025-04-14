vim.api.nvim_create_autocmd("CursorHoldI", {
	pattern = "*.cs",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local cursor = vim.api.nvim_win_get_cursor(0)
		local row, col = cursor[1] - 1, cursor[2]

		local line = vim.api.nvim_buf_get_lines(bufnr, row, row + 1, false)[1]
		if not line or #line == 0 then
			return
		end
		if col > #line then
			return
		end

		if line:sub(1, col):find("%(") then
			vim.lsp.buf.signature_help()
		end
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "vimwiki" },
	callback = function()
		vim.keymap.set("n", "_", function()
			local line = vim.api.nvim_get_current_line()
			local indent = line:match("^%s*") or ""
			local content = line:match("^%s*(.*)")
			local new_line

			if line:match("^%s*%- %[ %]") then
				new_line = indent .. "- " .. content:sub(7)
			elseif line:match("^%s*%- ") then
				new_line = indent .. "- [ ] " .. content:sub(3)
			else
				new_line = indent .. "- " .. content
			end

			vim.api.nvim_set_current_line(new_line)
		end, { buffer = true, desc = "Toggle markdown checkbox or dash" })
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
		vim.diagnostic.enable(true, { bunfr = e.buf })
	end,
})
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "i:n",
	desc = "Enable diagnostics when leaving insert mode",
	callback = function(e)
		vim.diagnostic.enable(true, { e.buf })
	end,
})

-- Disable line numbers for Markdown files
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.md" },
	callback = function()
		vim.wo.number = false
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "calendar",
	callback = function()
		vim.wo.number = false
	end,
})

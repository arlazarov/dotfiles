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

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained" }, {
	callback = function()
		vim.api.nvim_command("checktime")
	end,
})
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

local function open_with_system_app(path)
	local open_cmd
	if vim.fn.has("mac") == 1 then
		open_cmd = "open"
	elseif vim.fn.has("unix") == 1 then
		open_cmd = "xdg-open"
	elseif vim.fn.has("win32") == 1 then
		open_cmd = "start"
	else
		vim.notify("Unsupported OS", vim.log.levels.ERROR)
		return
	end
	vim.fn.jobstart({ open_cmd, path }, { detach = true })
end

vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = { "*.pdf", "*.png", "*.jpg", "*.jpeg", "*.webp", "*.gif" },
	callback = function(args)
		open_with_system_app(args.file)

		-- вместо bd!
		vim.bo.bufhidden = "wipe"
		vim.bo.buftype = "nofile"
		vim.bo.buflisted = false
		vim.bo.swapfile = false
		vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
	end,
})

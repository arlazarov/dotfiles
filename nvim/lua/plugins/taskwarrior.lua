return {
	"ribelo/taskwarrior.nvim",
	config = function()
		local task = require("taskwarrior_nvim")

		task.setup({
			mappings = {
				["<C-a>"] = function()
					local input = vim.fn.input("task add: ")
					task.cmd({ "add", unpack(vim.split(input, "%s+")) })
				end,

				["<C-d>"] = function(t)
					t:done()
				end,

				["<C-D>"] = function(t)
					t:delete()
				end,

				["<C-s>"] = function(t)
					if t.start then
						t:start()
					else
						t:stop()
					end
				end,

				["<C-y>"] = function(t)
					vim.fn.setreg("+", t.uuid)
					print("UUID yanked: " .. t.uuid)
				end,

				["<C-x>"] = function(t)
					local cmd = vim.fn.input("task command: ")
					t:cmd(vim.split(cmd, "%s+"))
				end,
			},
		})
		vim.keymap.set("n", "<leader>t", function()
			require("taskwarrior_nvim").browser({ "ready" })
		end, { desc = "Open Taskwarrior Browser" })
	end,
}

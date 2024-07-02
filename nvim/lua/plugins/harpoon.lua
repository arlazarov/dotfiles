return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim", "folke/which-key.nvim" },
	config = function()
		require("harpoon").setup({})

		-- Function to switch files
		local current_index = 1
		local function cycle_files(direction)
			local harpoon_ui = require("harpoon.ui")
			local harpoon_mark = require("harpoon.mark")
			local total_files = harpoon_mark.get_length()
			current_index = current_index + direction
			if current_index > total_files then
				current_index = 1
			elseif current_index < 1 then
				current_index = total_files
			end
			harpoon_ui.nav_file(current_index)
		end

		-- Setup which-key bindings
		local wk = require("which-key")
		wk.register({
			["<cr>"] = {
				function()
					cycle_files(1)
				end,
				"Harpoon: Next File",
			},
			h = {
				name = "Harpoon",
				a = {
					function()
						require("harpoon.mark").add_file()
					end,
					"Harpoon: Add File",
				},
				o = {
					function()
						require("harpoon.ui").toggle_quick_menu()
					end,
					"Harpoon: Toggle Menu",
				},
				["1"] = {
					function()
						require("harpoon.ui").nav_file(1)
					end,
					"Harpoon: Navigate to 1",
				},
				["2"] = {
					function()
						require("harpoon.ui").nav_file(2)
					end,
					"Harpoon: Navigate to 2",
				},
				["3"] = {
					function()
						require("harpoon.ui").nav_file(3)
					end,
					"Harpoon: Navigate to 3",
				},
				["4"] = {
					function()
						require("harpoon.ui").nav_file(4)
					end,
					"Harpoon: Navigate to 4",
				},
				n = {
					function()
						cycle_files(1)
					end,
					"Harpoon: Next File",
				},
				p = {
					function()
						cycle_files(-1)
					end,
					"Harpoon: Previous File",
				},
				d = {
					function()
						require("harpoon.mark").rm_file()
					end,
					"Harpoon: Remove File",
				},
				c = {
					function()
						require("harpoon.mark").clear_all()
					end,
					"Harpoon: Clear All Files",
				},
			},
		}, { prefix = "<leader>" })

		vim.keymap.set("n", "<leader><cr>", function()
			require("harpoon.ui").toggle_quick_menu()
		end, { noremap = true, silent = true })
	end,
}

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	ft = "markdown",

	-- Key mappings
	init = function()
		vim.keymap.set("n", "<leader>o", "<nop>", { desc = "Obsidian" })
		vim.keymap.set("n", "<leader>on", "<nop>", { desc = "Notes" })
		vim.keymap.set(
			"n",
			"<leader>onn",
			"<cmd>ObsidianNew<cr>",
			{ desc = "[N]ote" }
		)
		vim.keymap.set(
			"n",
			"<leader>ont",
			"<cmd>ObsidianNewFromTemplate<cr>",
			{ desc = "[T]emplate" }
		)
		vim.keymap.set(
			"v",
			"<leader>ol",
			"<cmd>ObsidianLinkNew<cr>",
			{ desc = "[L]ink" }
		)
		vim.keymap.set(
			"n",
			"<leader>ob",
			"<cmd>ObsidianBacklinks<cr>",
			{ desc = "[B]acklinks" }
		)
		vim.keymap.set(
			"n",
			"<leader>of",
			"<cmd>ObsidianSearch<cr>",
			{ desc = "[F]ind" }
		)
		vim.keymap.set(
			"n",
			"<leader>ot",
			"<cmd>ObsidianTags<cr>",
			{ desc = "[T]ags" }
		)
		vim.keymap.set(
			"n",
			"<leader>oq",
			"<cmd>ObsidianQuickSwitch<cr>",
			{ desc = "[Q]uick switch" }
		)
		vim.keymap.set(
			"n",
			"<leader>ow",
			"<cmd>ObsidianWorkspace<cr>",
			{ desc = "[W]orkspace" }
		)
		vim.keymap.set(
			"n",
			"<leader>or",
			"<cmd>ObsidianRename<cr>",
			{ desc = "[R]ename" }
		)
		vim.keymap.set(
			"n",
			"<leader>o<leader>",
			"<nop>",
			{ desc = "Daily/Find" }
		)

		vim.keymap.set(
			"n",
			"<leader>o<leader>f",
			"<cmd>ObsidianDailies<cr>",
			{ desc = "[F]ind" }
		)
		vim.keymap.set(
			"n",
			"<leader>o<leader>o",
			"<cmd>ObsidianToday<cr>",
			{ desc = "T[O]day" }
		)
		vim.keymap.set(
			"n",
			"<leader>o<leader>y",
			"<cmd>ObsidianToday - 1<cr>",
			{ desc = "[Y]esterday" }
		)
		vim.keymap.set(
			"n",
			"<leader>o<leader>t",
			"<cmd>ObsidianToday + 1<cr>",
			{ desc = "[T]omorrow" }
		)
		vim.keymap.set(
			"n",
			"<leader>oe",
			"<cmd>ObsidianExtractNote<cr>",
			{ desc = "[E]xtract" }
		)
		vim.keymap.set(
			"n",
			"<leader>om",
			"<cmd>MarkdownPreviewToggle<cr>",
			{ desc = "[M]arkdown Toggle" }
		)
		vim.keymap.set(
			"n",
			"<leader>od",
			"<cmd>ObsidianDailies<cr>",
			{ desc = "[D]aily Notes" }
		)
		vim.keymap.set("n", "<leader>oo", function()
			vim.cmd("edit ~/GG Freight Services/Notes/Quick notes.md")
		end, { desc = "Quick N[O]tes" })
		vim.keymap.set("n", "<leader>o<leader>q", function()
			vim.cmd("edit ~/GG Freight Services//Notes/Tasks.md")
		end, { desc = "[Quick] Tasks" })
	end,
	opts = {
		workspaces = {
			{
				name = "work",
				path = "~/GG Freight Services/",
			},
		},
		preferred_link_style = "markdown",

		ui = {
			enable = false,
			checkboxes = {
				[" "] = { char = "☐", hl_group = "ObsidianTodo" },
				["x"] = { char = "✔", hl_group = "ObsidianDone" },
			},
			hl_groups = {
				ObsidianTodo = { bold = true, fg = "#f78c6c" },
				ObsidianDone = { bold = true, fg = "#89ddff" },
				ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
				ObsidianTilde = { bold = true, fg = "#ff5370" },
				ObsidianImportant = { bold = true, fg = "#d73128" },
				ObsidianBullet = { bold = true, fg = "#89ddff" },
				ObsidianRefText = { underline = false, fg = "#89ddff" },
				ObsidianExtLinkIcon = { fg = "#89ddff" },
				ObsidianTag = { italic = true, fg = "#89ddff" },
				ObsidianBlockID = { italic = true, fg = "#89ddff" },
				ObsidianHighlightText = { bg = "#75662e" },
			},
		},

		-- Completion settings
		completion = {
			nvim_cmp = false,
			min_chars = 2,
		},

		-- Daily notes settings
		daily_notes = {
			folder = "Daily Notes",
			date_format = "%Y/%B/%d-%m-%Y",
			alias_format = "%B %d, %Y",
			default_tags = { "daily-notes" },
			template = "daily_notes_template.md",
		},

		notes_subdir = "Notes",
		new_notes_location = "current_dir",

		-- Template settings
		templates = {
			subdir = "_note_templates",
			date_format = "%B %d, %Y",
			time_format = "%H:%M",
			substitutions = {
				date1 = function()
					return os.date("%B, %Y", os.time())
				end,
				uid = function()
					local suffix = ""
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
					return tostring(os.time()) .. "-" .. suffix
				end,
			},
		},

		-- Custom note path function
		note_path_func = function(spec)
			local path = spec.dir / tostring(spec.title)
			return path:with_suffix(".md")
		end,

		-- Custom markdown link function
		markdown_link_func = function(opts)
			return require("obsidian.util").markdown_link(opts)
		end,
	},
}

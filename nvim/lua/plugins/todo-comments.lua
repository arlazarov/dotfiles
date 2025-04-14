return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = true, -- show icons in the signs column
		sign_priority = 8, -- sign priority
		-- keywords recognized as todo comments
		keywords = {
			DONE = {
				icon = " ",
				color = "done",
				alt = { "YARDFIX", "FIXED", "UPDATED" },
			},
			TODO = {
				icon = " ",
				alt = { "TODOLOW", "TODOHIGH", "UPDATE", "LOGBOOK" },
				color = "todo",
			},
			DAMAGE = {
				icon = " ",
				color = "warning",
				alt = { "WARNING", "COLLISION" },
			},
			IMPORTANT = {
				icon = " ", -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIX, FIXME", "BUG", "FIXIT", "ISSUE", "UNSAFE" }, -- a set of other keywords that all map to this FIX keywords
			},
			NOTE = {
				icon = " ",
				color = "hint",
				alt = { "INFO", "INPROGRESS" },
			},
			QUERY = {
				icon = " ",
				color = "query",
				alt = { "WAITING", "HOLD", "ONHOLD", "INSPECTION", "INSERVICE" },
			},
			SIMON = {
				icon = "🆂 ",
				color = "boss",
			},
			VLAD = {
				icon = "🆅 ",
				color = "boss",
			},
			GOD = {
				color = "god",
				icon = "⚡",
			},
			DRAGON = {
				color = "dragon",
				icon = " ",
			},
			DEMON = {
				color = "demon",
				icon = " ",
			},
			TIGER = {
				color = "tiger",
				icon = " ",
			},
			WOLF = {
				color = "wolf",
				icon = " ",
			},
		},
		gui_style = {
			fg = "NONE", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
		},
		-- pattern = [[\b#\s*(KEYWORDS)\b]],

		highlight = {
			pattern = [[#(KEYWORDS)]],
			multiline = true, -- enable multiline todo comments
			multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			before = "", -- "fg" or "bg" or empty
			keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty.
			after = "fg", -- "fg" or "bg" or empty
			-- pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
			comments_only = false, -- Allow the plugin to match keywords outside of comments
			max_line_len = 400, -- ignore lines longer than this
			exclude = {}, -- list of file types to exclude highlighting
		},
		colors = {
			done = { "DiagnosticInfo", "#2563EB" },
			todo = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
			important = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			default = { "Identifier", "#7C3AED" },
			hint = { "DiagnosticHint", "#10B981" },
			query = { "Identifier", "#FF00FF" },
			boss = { "#00FFFF", "FF00FF" },

			god = { "DiagnosticHint", "#10B981" },
			dragon = { "DiagnosticError", "ErrorMsg", "#DC2626" },
			demon = { "#00FFFF", "FF00FF" },
			tiger = { "DiagnosticInfo", "#2563EB" },
			wolf = { "Identifier", "#FF00FF" },
		},
	},
	-- config = function()
	-- 	local todo_comments = require("todo-comments")
	--
	-- 	local keymap = vim.keymap
	-- 	keymap.set("n", "]t", function()
	-- 		todo_comments.jump_next()
	-- 	end, { desc = "Next todo comment" })
	--
	-- 	keymap.set("n", "[t", function()
	-- 		todo_comments.jump_prev()
	-- 	end, { desc = "Previous todo comment" })
	--
	-- 	todo_comments.setup()
	-- end,
}

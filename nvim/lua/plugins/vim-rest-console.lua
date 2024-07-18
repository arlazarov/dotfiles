return {
	"diepm/vim-rest-console",
	config = function()
		vim.g.vrc_set_default_mapping = 0
		-- vim.g.vrc_split_request_body = 1
		vim.g.vrc_response_default_content_typr = "application/json"
		vim.g.vrc_output_buffer_name = "_OUTPUT.json"
		vim.g.vrc_auto_format_response_patterns = {
			json = "jq",
		}
		vim.g.vrc_curl_opts = {
			["-sS"] = "",
			["--connect-timeout"] = 10,
			["-i"] = "",
			["--silent"] = "",
			["--max-time"] = 60,
			["-k"] = "",
		}

		require("which-key").add({
			{ "<leader>c", group = "Code" },
			{
				"<leader>cr",
				"<cmd>call VrcQuery()<cr>",
				desc = "Code: rest-console",
			},
		})
	end,
}

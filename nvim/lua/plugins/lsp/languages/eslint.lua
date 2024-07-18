local util = require("lspconfig.util")

return {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
	},
	settings = {
		format = true,
		quiet = false,
		rulesCustomizations = {
			{ rule = "no-console", severity = "off" },
			{ rule = "func-names", severity = "off" },
			{ rule = "indent", severity = "off" },
			{ rule = "no-param-reassign", severity = "off" },
			{ rule = "arrow-parens", severity = "off" },
			{ rule = "no-underscore-dangle", severity = "off" },
			{ rule = "no-return-await", severity = "off" },
			{ rule = "implicit-arrow-linebreak", severity = "off" },
			{ rule = "operator-linebreak", severity = "off" },
			{ rule = "curly", severity = "off" },
			{ rule = "nonblock-statement-body-position", severity = "off" },
			{
				rule = "no-unused-vars",
				severity = "off",
				options = { argsIgnorePattern = "^_", varsIgnorePattern = "^_" },
			},
		},
		run = "onType",
		problems = {
			shortenToSingleLine = true,
		},
	},
	root_dir = util.root_pattern(
		".eslintrc",
		".eslintrc.js",
		".eslintrc.json",
		"package.json"
	),
}

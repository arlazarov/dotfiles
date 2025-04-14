return {
	cmd = {
		"omnisharp",
		"--languageserver",
		"--hostPID",
		tostring(vim.fn.getpid()),
	},
	root_dir = require("lspconfig").util.root_pattern("*.sln", "*.csproj"),
	settings = {
		omnisharp = {
			useModernNet = false,
			useGlobalMono = "always",
			monoPath = "/opt/homebrew/bin/mono",

			enableMsBuildLoadProjectsOnDemand = false,
			enableRoslynAnalyzers = true,
			organizeImportsOnFormat = true,
			enableImportCompletion = true,
			FormattingOptions = {
				EnableEditorConfigSupport = true,
				OrganizeImports = true,
			},
			RoslynExtensionsOptions = {
				EnableAnalyzersSupport = false,
			},
			msbuild = {
				UseLegacySdkResolver = false,
			},
		},
	},
}

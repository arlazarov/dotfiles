return {
	cmd = {
		"omnisharp",
		"--languageserver",
		"--hostPID",
		tostring(vim.fn.getpid()),
	},
	settings = {
		omnisharp = {
			enableMsBuildLoadProjectsOnDemand = false,
			enableRoslynAnalyzers = true,
			organizeImportsOnFormat = true,
			enableImportCompletion = true,
			useModernNet = true,
		},
	},
}

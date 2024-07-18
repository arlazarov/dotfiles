return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"folke/which-key.nvim",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")
			local fn = vim.fn

			-- Setup DAP UI and virtual text
			require("dapui").setup()
			require("nvim-dap-virtual-text").setup({})

			-- Configure DAP adapter for Node.js
			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = {
					os.getenv("HOME")
						.. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js",
				},
			}

			-- DAP configurations for JavaScript
			dap.configurations.javascript = {
				{
					name = "Launch",
					type = "node2",
					request = "launch",
					program = "${file}",
					cwd = vim.fn.getcwd(),
					sourceMaps = true,
					protocol = "inspector",
					console = "integratedTerminal",
				},
				{
					name = "Attach to process",
					type = "node2",
					request = "attach",
					processId = require("dap.utils").pick_process,
				},
			}

			-- Open and refresh DAP UI on debug events
			dap.listeners.after.event_initialized["dapui"] = function()
				require("dapui").open({})
				require("nvim-dap-virtual-text").refresh()
			end
			dap.listeners.after.event_terminated["dapui"] = function()
				require("dapui").close({})
				require("nvim-dap-virtual-text").refresh()
				vim.cmd("silent! bd! \\[dap-repl]")
			end
			dap.listeners.before.event_exited["dapui"] = function()
				require("dapui").close({})
				require("nvim-dap-virtual-text").refresh()
				vim.cmd("silent! bd! \\[dap-repl]")
			end

			-- Register DAP keybindings with which-key
			require("which-key").add({
				{
					"<leader>d",
					group = "Debug",
				},
				{
					"<leader>db",
					function()
						dap.toggle_breakpoint()
					end,
					desc = "DAP: toggle breakpoint",
				},
				{
					"<leader>d-",
					function()
						dap.clear_breakpoints()
					end,
					desc = "DAP: toggle breakpoint",
				},
				{
					"<leader>dc",
					function()
						dap.continue()
					end,
					desc = "DAP: continue",
				},
				{
					"<leader>du",
					function()
						ui.toggle()
					end,
					desc = "DAP: toggle ui",
				},
				{
					"<leader>do",
					function()
						dap.step_over()
					end,
					desc = "DAP: step over",
				},
				{
					"<leader>dO",
					function()
						dap.step_out()
					end,
					desc = "DAP: step out",
				},
				{
					"<leader>dn",
					function()
						dap.step_into()
					end,
					desc = "DAP: step into",
				},
				{
					"<leader>dN",
					function()
						dap.step_back()
					end,
					desc = "DAP: step back",
				},
				{
					"<leader>dr",
					function()
						dap.repl.toggle()
					end,
					desc = "DAP: toggle repl",
				},
				{
					"<leader>d.",
					function()
						dap.goto_()
					end,
					desc = "DAP: go to",
				},
				{
					"<leader>dh",
					function()
						dap.run_to_cursor()
					end,
					desc = "DAP: run to cursor",
				},
				{
					"<leader>dx",
					function()
						dap.set_exception_breakpoints()
					end,
					desc = "DAP: set exception breakpoints",
				},
				{
					"<leader>dR",
					function()
						dap.restart()
					end,
					desc = "DAP: restart",
				},
				{
					"<leader>dq",
					function()
						dap.disconnect({ terminateDebuggee = true })
					end,
					desc = "DAP: quit",
				},
				{
					"<leader>de",
					function()
						require("dapui").eval(nil, { enter = true })
					end,
					desc = "DAP: eval under cursor",
				},
			})

			-- Define DAP signs for breakpoints and debug points
			fn.sign_define("DapBreakpoint", {
				text = "",
				texthl = "debugBreakpoint",
				linehl = "",
				numhl = "",
			})
			fn.sign_define("DapBreakpointCondition", {
				text = "",
				texthl = "DiagnosticSignWarn",
				linehl = "",
				numhl = "",
			})
			fn.sign_define("DapBreakpointRejected", {
				text = "",
				texthl = "DiagnosticSignError",
				linehl = "",
				numhl = "",
			})
			fn.sign_define("DapLogPoint", {
				text = " ",
				texthl = "debugBreakpoint",
				linehl = "",
				numhl = "",
			})
			fn.sign_define("DapStopped", {
				text = "",
				texthl = "debugBreakpoint",
				linehl = "",
				numhl = "",
			})
		end,
	},
}

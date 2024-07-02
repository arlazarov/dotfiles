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
				args = { os.getenv("HOME") .. "/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
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
			require("which-key").register({
				d = {
					name = "Debug",
					b = {
						function()
							dap.toggle_breakpoint()
						end,
						"DAP: toggle breakpoint",
					},
					c = {
						function()
							dap.continue()
						end,
						"DAP: continue",
					},
					u = {
						function()
							ui.toggle()
						end,
						"DAP: toggle ui",
					},
					o = {
						function()
							dap.step_over()
						end,
						"DAP: step over",
					},
					O = {
						function()
							dap.step_out()
						end,
						"DAP: step out",
					},
					n = {
						function()
							dap.step_into()
						end,
						"DAP: step into",
					},
					N = {
						function()
							dap.step_back()
						end,
						"DAP: step back",
					},
					r = {
						function()
							dap.repl.toggle()
						end,
						"DAP: toggle repl",
					},
					["."] = {
						function()
							dap.goto_()
						end,
						"DAP: go to",
					},
					h = {
						function()
							dap.run_to_cursor()
						end,
						"DAP: run to cursor",
					},
					x = {
						function()
							dap.set_exception_breakpoints()
						end,
						"DAP: set exception breakpoints",
					},
					R = {
						function()
							dap.restart()
						end,
						"DAP: restart",
					},
					q = {
						function()
							dap.disconnect({ terminateDebuggee = true })
						end,
						"DAP: quit",
					},
					e = {
						function()
							require("dapui").eval(nil, { enter = true })
						end,
						"DAP: eval under cursor",
					},
				},
			}, { prefix = "<leader>" })

			-- Define DAP signs for breakpoints and debug points
			fn.sign_define(
				"DapBreakpoint",
				{ text = "", texthl = "debugBreakpoint", linehl = "", numhl = "debugBreakpoint" }
			)
			fn.sign_define(
				"DapBreakpointCondition",
				{ text = "", texthl = "DiagnosticSignWarn", linehl = "", numhl = "debugBreakpoint" }
			)
			fn.sign_define(
				"DapBreakpointRejected",
				{ text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "debugBreakpoint" }
			)
			fn.sign_define(
				"DapLogPoint",
				{ text = " ", texthl = "debugBreakpoint", linehl = "", numhl = "debugBreakpoint" }
			)
			fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "debugBreakpoint", linehl = "debugPC", numhl = "DiagnosticSignError" }
			)
		end,
	},
}

local dap = require("dap")
local dapgo = require("dap-go")
local dapui = require("dapui")

dapui.setup()
dapgo.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- vim.keymap.set("n", "<Leader>ds", function()
--   dap.continue()
--   dapui.toggle({})
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
-- end)
-- vim.keymap.set("n", "<Leader>de", function()
--   dap.terminate()
--   dapui.toggle({})
-- end)
vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Run Debugger" })
vim.keymap.set(
  "n",
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
vim.keymap.set("n", "<Leader>dl", dap.step_into, { desc = "Step Into" })
vim.keymap.set("n", "<Leader>dj", dap.step_over, { desc = "Step Over" })
vim.keymap.set("n", "<Leader>dk", dap.step_out, { desc = "Step Out" })
vim.keymap.set("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
vim.keymap.set("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })
vim.keymap.set("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- vim.keymap.set("n", "<Leader>df", function()
--   local widgets = require("dap.ui.widgets")
--   widgets.centered_float(widgets.frames)
-- end)

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", numhl = "" })

local dap = require('dap')
local dapui = require('dapui')

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

-- aways use main.go as default file for dap
dap.adapters.go = function(callback, config)
  local executable = vim.fn.input('Path to executable: ')
  if executable == nil or executable == '' then
    return callback({ type = 'server', host = '127.0.0.1', port = 2345 })
  end
  callback({ type = 'executable', command = executable, args = { 'main.go' } })
end

require('dap-go').setup()

require('dapui').setup()
-- Keybinding to toggle nvim-dap-ui using leader + dd
vim.api.nvim_set_keymap('n', '<leader>dd', [[<cmd>lua require('dapui').toggle()<CR>]], { noremap = true, silent = true })
vim.keymap.set("n", "<Leader>dt", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})
vim.api.nvim_set_keymap("n", "<leader>dr", ":lua require('dapui').open({reset=true})<CR>", {noremap=true})


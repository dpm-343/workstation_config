local ssh_client = vim.env.SSH_CLIENT or ""
local is_mac_terminal = vim.env.TERM_PROGRAM == "Apple_Terminal"

if is_mac_terminal or ssh_client ~= "" then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end


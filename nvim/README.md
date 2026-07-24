Install Neovim

```
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
<<<<<<< HEAD
'''


# Fix OSC52 from Mac

Corrects the text +q4D73 showing up in NVIM over SSH from MacOS

## Pass TERM_PROGRAM Variable from MAC

If you are running Neovim over an SSH session rather than locally on the Mac, native macOS terminals (like the default Terminal app) pass a specific variable called TERM_PROGRAM=Apple_Terminal. To make sure your remote Linux machine actually receives it, configure your Mac's local SSH client.

1. On Mac, add to the ~/.ssh/config file:
'''Host *
  SendEnv TERM_PROGRAM'''

2. On Remote server add the following to /etc/ssh/sshd_config:
'''AcceptEnv LANG LC_* TERM_PROGRAM'''

3. Restart SSHD on remote server

## Add LUA configuration to NVIM

1. create ~/.config/nvim/lua/config/option.lua

'''
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
'''

2. If nvim is run via sudo, run `sudo visudo` and add the following line:

'''
Defaults env_keep += "TERM_PROGRAM"
'''

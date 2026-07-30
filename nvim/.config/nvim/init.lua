-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

if vim.env.SSH_CONNECTION or vim.env.SSH_TTY then
  -- Settings for SSH sessions
  vim.opt.mouse = "r" -- or "" to disable, or "a" to enable all
else
  -- Settings for local sessions
  vim.opt.mouse = "a"
end

-- Initialize lazy.nvim and pass options
require("lazy").setup({
  spec = {
    -- Automatically imports everything from your lua/plugins/ folder
    { import = "plugins" }, 
  },
  
  -- Put the install settings table right here:
  install = { 
    colorscheme = { "tokyonight" } 
  },
})

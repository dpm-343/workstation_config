return {
  "folke/tokyonight.nvim",
  lazy = false,    -- Load it immediately so lualine can find it on startup
  priority = 1000, -- Force it to load before lualine processes its settings
  config = function()
    -- Set it as your main editor theme
    vim.cmd([[colorscheme tokyonight]])
  end,
}


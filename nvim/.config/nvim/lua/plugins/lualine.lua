return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = 'tokyonight',
        icons_enabled = true,
      },
      sections = {
        -- Keep standard default modules for the left and center sections
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        
        -- Customized right sections
        lualine_y = {
          { "%2p%%" } -- Replaces percentage with Current Line / Total Lines (e.g., 42/150)
        },
        lualine_z = {'%4l(%L):%-2c'} -- Keeps the standard "Line:Column" display
      }
    })
  end
}


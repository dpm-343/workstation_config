return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    -- Load the modern module
    local ts = require("nvim-treesitter")
    
    -- Run the setup function safely
    ts.setup({})
    
    -- Tell Treesitter which language parsers to automatically download
    ts.install({ "lua", "vim", "vimdoc", "query" })
    
    -- Enable modern syntax highlighting via Neovim's engine
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "vim", "vimdoc", "query" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end
}


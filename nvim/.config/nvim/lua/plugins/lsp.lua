return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Initialize Mason to download binaries
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "clangd" },
      })

      -- Modern Neovim 0.11+ API to activate language servers
      -- It automatically loads adjustments from your lua/lsp/ folder
      vim.lsp.enable({ "clangd" })
    end,
  },
}


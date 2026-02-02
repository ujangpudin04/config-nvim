return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      tsserver = {},
      eslint = {},
      rust_analyzer = { enabled = false },
      gopls = {
        settings = {
          gopls = {
            usePlaceholders = true,
            completeUnimported = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      },
    },
  },
}

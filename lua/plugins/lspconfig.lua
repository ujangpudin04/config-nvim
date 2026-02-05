return {
  "neovim/nvim-lspconfig",

  event = { "BufReadPre", "BufNewFile" },
  opts = {
    servers = {
      tsserver = {
        root_dir = function(fname)
          local util = require("lspconfig.util")
          return util.root_pattern("package.json", "tsconfig.json", ".git")(fname)
        end,
        settings = {
          typescript = {
            preferences = {
              disableSuggestions = true,
            },
          },
        },
      },
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

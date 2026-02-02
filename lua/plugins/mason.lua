return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        
        "gopls",

        
        "typescript-language-server",
        "eslint-lsp",
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "lua-language-server",

        
        "prettier",
        "stylua",
        "gofumpt",
        "goimports",
        "golangci-lint",
      },
      auto_update = false,
    },
  },
}

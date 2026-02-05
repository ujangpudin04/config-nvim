return {
  {
    "mason-org/mason.nvim",
    dependencies = {
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
          },
          auto_update = true,
          run_on_start = true,
        },
      },
    },
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
}

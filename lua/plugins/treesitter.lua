return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "bash",

      
      "go",
      "gomod",
      "gowork",
      "gosum",

      
      "git_config",
      "gitcommit",
      "git_rebase",
      "gitignore",
      "gitattributes",

      "rust",
      "typescript",
      "tsx",
      "javascript",
      "json",
      "yaml",
      "html",
      "css",
      "markdown",
      "toml",
      "lua",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}

return {
  "nvim-treesitter/nvim-treesitter",
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
      "html",
      "css",

      "markdown",
      "toml",
      "yaml",
    },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(_, bufnr)
        local max_filesize = 100 * 1024 -- 100KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },

    indent = { enable = true },
  },

  init = function()
    -- Matikan treesitter otomatis untuk file besar
    vim.api.nvim_create_autocmd("BufReadPre", {
      callback = function(args)
        local stats = vim.loop.fs_stat(args.file)
        if stats and stats.size > 500 * 1024 then
          vim.treesitter.stop(args.buf)
        end
      end,
    })
  end,
}

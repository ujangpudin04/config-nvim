return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  build = (not LazyVim.is_win())
      and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
    or nil,
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  opts = {
    history = true,
    delete_check_events = "TextChanged",
    update_events = "TextChanged,TextChangedI",
    -- Aktifkan untuk auto-expansion
    enable_autosnippets = true,
    -- Store selection untuk visual placeholder
    store_selection_keys = "<Tab>",
  },
  config = function(_, opts)
    local luasnip = require("luasnip")
    luasnip.setup(opts)

    luasnip.filetype_extend("typescriptreact", {
      "typescript",
      "javascriptreact",
      "react",
    })

    luasnip.filetype_extend("javascriptreact", {
      "javascript",
      "react",
    })

    -- Load snippets
    require("luasnip.loaders.from_vscode").lazy_load()
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/snippets" },
    })

    -- Tambahan: Load lua snippets jika ada
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/luasnippets" },
    })

    -- Keybindings untuk navigasi snippet
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })
  end,
}

return {
  "saghen/blink.cmp",
  event = "InsertEnter",

  opts = {

    sources = {
      default = { "lsp", "snippets", "path", "buffer" },
    },

    appearance = {
      kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰊄",
      },
    },

    keymap = {
      preset = "default",

      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },

      ["<CR>"] = { "accept", "fallback" },

      ["<C-e>"] = { "hide" },
      ["<C-n>"] = { "select_next" },
      ["<C-p>"] = { "select_prev" },
    },

    completion = {
      trigger = {
        prefetch_on_insert = true,
      },

      list = {
        selection = {
          auto_insert = true,
        },
      },

      menu = {
        border = "rounded",
        draw = {
          padding = 1,
          gap = 1,
        },
      },

      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "rounded",
        },
      },
    },

    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
  },
}

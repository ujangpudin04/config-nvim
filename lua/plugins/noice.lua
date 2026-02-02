return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim", 
    "rcarriga/nvim-notify", 
  },

  opts = {
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
    },

    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },

    views = {
      cmdline_popup = {
        position = {
          row = "40%",
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        border = {
          style = "rounded",
        },
      },
    },

    lsp = {
      progress = {
        enabled = false, 
      },
      hover = { enabled = true },
      signature = { enabled = true },
    },

    routes = {
      {
        filter = {
          event = "lsp",
          kind = "progress",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "rust%-analyzer",
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "msg_show",
          find = "%d+L, %d+B",
        },
        view = "mini",
      },
      {
        filter = {
          event = "msg_show",
          find = "written",
        },
        view = "mini",
      },
    },

    presets = {
      command_palette = true,
      long_message_to_split = true,
      inc_rename = true,
    },
  },
}

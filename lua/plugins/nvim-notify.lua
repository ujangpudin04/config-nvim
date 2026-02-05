return {
  "rcarriga/nvim-notify",
  lazy = false,
  priority = 1000,
  config = function()
    local notify = require("notify")

    notify.setup({
      stages = "fade",
      timeout = 3000,
      max_height = math.floor(vim.o.lines * 0.75),
      max_width = math.floor(vim.o.columns * 0.75),
      render = "wrapped-compact",
      background_colour = "#000000",
      fps = 30,
      level = 2,
    })

    vim.notify = notify
  end,
}

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    local toggleterm = require("toggleterm")

    toggleterm.setup({
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<C-_>]], -- toggle dengan Ctrl+\
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float", -- default: float | horizontal | vertical | tab
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = {
        border = "curved", -- single | double | shadow | curved
        winblend = 0,
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
    })

    -- Keluar dari terminal mode
    local keymap = vim.keymap
    keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
    keymap.set("t", "jk", "<C-\\><C-n>", { desc = "Exit terminal mode with jk" })

    -- Toggle berbagai arah
    keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
    keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
    keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle vertical terminal" })
    keymap.set("n", "<leader>tt", "<cmd>ToggleTerm direction=tab<CR>", { desc = "Toggle terminal in new tab" })

    -- Multiple terminal (ganti angka untuk terminal berbeda)
    keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm direction=float<CR>", { desc = "Terminal 1" })
    keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm direction=float<CR>", { desc = "Terminal 2" })
    keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm direction=float<CR>", { desc = "Terminal 3" })

    -- Lazygit di dalam toggleterm (bonus!)
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      dir = "git_dir",
      direction = "float",
      float_opts = {
        border = "curved",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
        -- Nonaktifkan Esc di lazygit supaya tidak konflik
        vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<Esc>", "<Esc>", { noremap = true, silent = true })
      end,
      on_close = function()
        vim.cmd("startinsert!")
      end,
    })

    keymap.set("n", "<leader>lg", function()
      lazygit:toggle()
    end, { desc = "Toggle lazygit (via toggleterm)" })
  end,
}

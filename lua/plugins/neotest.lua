return {
  "nvim-neotest/neotest",
  event = "VeryLazy",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mrcjkb/rustaceanvim",
    "nvim-neotest/neotest-go",
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("rustaceanvim.neotest")({
          dap_adapter = "codelldb",
        }),

        require("neotest-go")({
          experimental = {
            test_table = true,
          },
          args = { "-count=1", "-timeout=60s", "-race", "-coverprofile=" .. vim.fn.getcwd() .. "/coverage.out" },
        }),
      },

      quickfix = {
        enabled = true,
        open = false,
      },

      output = {
        enabled = true,
        open_on_run = "short",
      },

      output_panel = {
        enabled = true,
        open = "botright split | resize 15",
      },
      status = {
        enabled = true,
        virtual_text = true,
        signs = true,
      },

      icons = {
        passed = "✓",
        running = "●",
        failed = "✗",
        skipped = "⊘",
        unknown = "?",
      },

      floating = {
        border = "rounded",
        max_height = 0.6,
        max_width = 0.6,
      },
    })

    local neotest = require("neotest")

    vim.keymap.set("n", "<leader>tr", function()
      neotest.run.run()
    end, { desc = "Run nearest test" })

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { desc = "Run file tests" })

    vim.keymap.set("n", "<leader>ta", function()
      neotest.run.run(vim.fn.getcwd())
    end, { desc = "Run all tests" })

    vim.keymap.set("n", "<leader>td", function()
      neotest.run.run({ strategy = "dap", suite = false })
    end, { desc = "Debug nearest test" })

    vim.keymap.set("n", "<leader>ts", function()
      neotest.summary.toggle()
    end, { desc = "Toggle test summary" })

    vim.keymap.set("n", "<leader>to", function()
      neotest.output.open({ enter = true, auto_close = true })
    end, { desc = "Show test output" })

    vim.keymap.set("n", "<leader>tO", function()
      neotest.output_panel.toggle()
    end, { desc = "Toggle output panel" })

    vim.keymap.set("n", "<leader>tS", function()
      neotest.run.stop()
    end, { desc = "Stop test" })

    vim.keymap.set("n", "<leader>tw", function()
      neotest.watch.toggle(vim.fn.expand("%"))
    end, { desc = "Toggle watch mode" })

    vim.keymap.set("n", "<leader>tob", function()
      neotest.output_panel.toggle()
    end, { desc = "Output panel (bottom)" })

    vim.keymap.set("n", "<leader>tos", function()
      neotest.output.open({ enter = false })
      vim.cmd("wincmd L")
      vim.cmd("vertical resize 80")
    end, { desc = "Output (side)" })

    vim.keymap.set("n", "<leader>tof", function()
      neotest.output.open({ enter = true, auto_close = true })
    end, { desc = "Output (floating)" })
  end,
}

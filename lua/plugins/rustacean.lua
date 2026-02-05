return {
  "mrcjkb/rustaceanvim",
  version = "^7",
  ft = { "rust" },

  config = function()
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        source = "if_many",
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
      },
    })

    vim.g.rustaceanvim = {
      tools = {
        hover_actions = {
          auto_focus = false,
        },
        test_executor = "neotest",
        inlay_hints = {
          auto = true,
          only_current_line = true, -- Tampilkan hanya di current line
          show_parameter_hints = true,
        },
      },

      server = {
        on_attach = function(_, bufnr)
          local opts = { buffer = bufnr, silent = true }

          vim.keymap.set("n", "<leader>rr", "<cmd>RustLsp runnables<CR>", opts)
          vim.keymap.set("n", "<leader>rt", "<cmd>RustLsp testables<CR>", opts)
          vim.keymap.set("n", "<leader>rd", "<cmd>RustLsp debuggables<CR>", opts)
          vim.keymap.set("n", "<leader>re", "<cmd>RustLsp expandMacro<CR>", opts)
          vim.keymap.set("n", "<leader>rc", "<cmd>RustLsp openCargo<CR>", opts)
          vim.keymap.set("n", "<leader>rp", "<cmd>RustLsp parentModule<CR>", opts)
          vim.keymap.set("n", "K", "<cmd>RustLsp hover actions<CR>", opts)

          vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>RustLsp codeAction<CR>", opts)

          vim.keymap.set("n", "<leader>qf", function()
            vim.lsp.buf.code_action({
              filter = function(a)
                return a.isPreferred
              end,
              apply = true,
            })
          end, { buffer = bufnr, desc = "Quick fix" })

          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        end,

        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              buildScripts = {
                enable = true,
              },
              targetDir = "target/rust-analyzer",
            },

            completion = {
              postfix = { enable = true },
            },

            checkOnSave = {
              command = "clippy",
            },

            procMacro = {
              enable = true,
            },

            diagnostics = {
              enable = true,
              disabled = { "unresolved-proc-macro" },
              enableExperimental = true,
              warningsAsInfo = {},
              warningsAsHint = {},
            },
          },
        },
      },

      dap = {
        adapter = {
          type = "server",
          port = "${port}",
          executable = {
            command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
            args = { "--port", "${port}" },
          },
        },
      },
    }
  end,
}

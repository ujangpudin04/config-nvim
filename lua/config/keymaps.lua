vim.keymap.set("n", "<leader>nh", function()
  require("telescope").extensions.noice.noice()
end, { desc = "Noice History" })

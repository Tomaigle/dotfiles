-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>cr", "<cmd>CMakeRun<cr>", { desc = "CMake: Run Executable" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename (LSP)" })

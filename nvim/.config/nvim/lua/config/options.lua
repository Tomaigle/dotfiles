-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.root_spec = {
  { ".git", "Makefile", ".project", ".lazy-root" },
  "lsp",
  "cwd",
}
vim.opt.shell = "fish"
vim.g.lazyvim_python_lsp = "basedpyright"
vim.opt.spelllang = { "en", "pl" }
vim.opt.spell = true

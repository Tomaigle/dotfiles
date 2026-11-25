-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_python_lsp = "basedpyright"
vim.opt.spelllang = { "en", "pl" }

vim.filetype.add({
  extension = {
    urdf = "xml",
    xacro = "xml",
    sdf = "xml",
    launch = "xml",
    repos = "yaml",
    rviz = "yaml",
    world = "xml",
  },
})

if vim.fn.executable(vim.o.shell) == 0 then
  vim.o.shell = "bash"
end
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

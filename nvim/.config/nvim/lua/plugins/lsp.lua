return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          { "<leader>cr", false },
          { "<leader>cR", vim.lsp.buf.rename, desc = "Rename (LSP)", has = "rename" },
        },
      },
    },
  },
}

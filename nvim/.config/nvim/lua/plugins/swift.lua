return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          mason = false, -- toolchain lives in the distrobox
          cmd = { vim.fn.expand("~/.local/bin/sourcekit-lsp") },
          filetypes = { "swift" },
          root_markers = { "Package.swift", ".git" },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "swift" })
    end,
  },
}

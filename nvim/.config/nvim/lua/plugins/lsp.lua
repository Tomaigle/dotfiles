return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        mason = false,
        cmd = {
          vim.fn.expand("~/.local/bin/ros-lsp"),
          "clangd",
          "--background-index",
          "--header-insertion=never",
        },
      },
      basedpyright = {
        mason = false,
        cmd = {
          vim.fn.expand("~/.local/bin/ros-lsp"),
          "basedpyright-langserver",
          "--stdio",
        },
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "standard",
              diagnosticSeverityOverrides = {
                reportUnknownMemberType = "none",
                reportUnknownArgumentType = "none",
                reportUnknownVariableType = "none",
                reportAny = "none",
                reportUnusedCallResult = "none",
              },
            },
          },
        },
      },
      ["*"] = {
        keys = {
          { "<leader>cr", false },
          { "<leader>rn", vim.lsp.buf.rename, desc = "Rename (LSP)", has = "rename" },
        },
      },
    },
  },
}

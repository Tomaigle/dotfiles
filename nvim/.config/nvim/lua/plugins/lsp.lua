return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      basedpyright = {
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

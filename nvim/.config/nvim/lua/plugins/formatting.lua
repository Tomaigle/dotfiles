return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
      python = { "ruff_format" },
      html = { "prettier" },
      css = { "prettier" },
      php = { "prettier" },
      haskell = { "fourmolu" },
    },
  },
}

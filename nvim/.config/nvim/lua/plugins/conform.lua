return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters = {
      prettier = {
        require_cwd = false,
        condition = function()
          return true
        end,
      },
    },
    formatters_by_ft = {
      php = { "php_cs_fixer" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
    },
  },
}

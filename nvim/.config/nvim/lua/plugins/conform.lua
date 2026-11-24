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
      tex = { "tex-fmt" },
    },
  },
}

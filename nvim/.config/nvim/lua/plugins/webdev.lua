return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {},
        html = {},
        jsonls = {},
        intelephense = {}, -- PHP LSP
      },
    },
  },

  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },

  {
    "olrtg/nvim-emmet",
    keys = {
      {
        "<leader>xe",
        function()
          require("nvim-emmet"):wrap_with_abbreviation()
        end,
      },
    },
  },

  { "NvChad/nvim-colorizer.lua", opts = { user_default_options = { css = true } } },
  { "uga-rosa/ccc.nvim", opts = {}, keys = { { "<leader>cp", "<cmd>CccPick<cr>" } } },
}

return {
  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = {
      settings = {
        options = {
          notify_user_on_venv_activation = true,
        },
      },
    },
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>", desc = "Select VirtualEnv" },
    },
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end,
    keys = {
      {
        "<leader>dpm",
        function()
          require("dap-python").test_method()
        end,
        desc = "Debug Test Method",
      },
      {
        "<leader>dpc",
        function()
          require("dap-python").test_class()
        end,
        desc = "Debug Test Class",
      },
      {
        "<leader>r",
        function()
          local file = vim.fn.expand("%:p")
          Snacks.terminal.open("python3 " .. vim.fn.shellescape(file))
        end,
        ft = "python",
        desc = "Run Current Python File",
      },
    },
  },
}

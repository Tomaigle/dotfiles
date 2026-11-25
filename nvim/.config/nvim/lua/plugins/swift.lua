return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sourcekit = {
          mason = false,
          cmd = { vim.fn.expand("~/.local/bin/sourcekit-lsp") },
          filetypes = { "swift" },
          root_markers = { "Package.swift", ".git" },
        },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    opts = function()
      local dap = require("dap")

      dap.adapters.lldb = {
        type = "executable",
        command = vim.fn.expand("~/.local/bin/lldb-dap"),
        name = "lldb",
      }

      dap.configurations.swift = {
        {
          name = "Launch Swift target",
          type = "lldb",
          request = "launch",
          program = function()
            local root = vim.fs.root(0, { "Package.swift" }) or vim.fn.getcwd()
            local default = vim.api.nvim_buf_get_name(0):match("/Sources/([^/]+)/")
            local target = vim.fn.input("Target: ", default or "")
            return root .. "/.build/debug/" .. target
          end,
          cwd = "${workspaceFolder}",
          args = {},
          stopOnEntry = false,
        },
      }
    end,
  },
}

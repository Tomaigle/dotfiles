local wrap = vim.fn.expand("~/.local/bin/ros-lsp")
local in_ros = vim.env.ROS_DISTRO ~= nil
local use_wrap = (not in_ros) and (vim.fn.executable(wrap) == 1)

local function cmd(base)
  if use_wrap then
    return vim.list_extend({ wrap }, base)
  end
  return base
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        mason = false,
        cmd = cmd({
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        }),
      },
      basedpyright = {
        mason = false,
        cmd = cmd({ "basedpyright-langserver", "--stdio" }),
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
                reportPrivateImportUsage = "none",
              },
            },
          },
        },
      },
      html = {},
      cssls = {},
      emmet_language_server = {},
      lemminx = {},
      ["*"] = {
        keys = {
          { "<leader>cr", false },
          { "<leader>rn", vim.lsp.buf.rename, desc = "Rename (LSP)", has = "rename" },
        },
      },
    },
  },
}

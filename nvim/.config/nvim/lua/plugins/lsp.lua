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
      clangd = {
        keys = {
          {
            "<leader>ch",
            function()
              local f = vim.fn.expand("%:p")
              local ext = f:match("%.(%w+)$")
              local base = f:gsub("%.%w+$", "")

              local src_ext = { "cpp", "cc", "cxx", "c" }
              local hdr_ext = { "h", "hpp", "hh", "hxx" }

              local is_hdr = vim.tbl_contains(hdr_ext, ext)
              local from_dir, to_dir = "/include/", "/src/"
              if not is_hdr then
                from_dir, to_dir = to_dir, from_dir
              end
              local exts = is_hdr and src_ext or hdr_ext

              local bases = { base:gsub(from_dir, to_dir), base }
              for _, b in ipairs(bases) do
                for _, e in ipairs(exts) do
                  local alt = b .. "." .. e
                  if vim.uv.fs_stat(alt) then
                    vim.cmd.edit(alt)
                    return
                  end
                end
              end
              vim.notify("No counterpart found for " .. vim.fn.expand("%:t"))
            end,
            desc = "Switch Source/Header (C/C++)",
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

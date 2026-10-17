return {
  "Civitasv/cmake-tools.nvim",
  ft = { "c", "cpp", "objc", "objcpp", "h", "hpp", "cmake" },
  opts = {
    cmake_command = "cmake",
    cmake_build_directory = "build",
    cmake_generate_options = {
      "-GNinja",
      "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
    },
    cmake_build_options = {},
    cmake_console_size = 10,
    cmake_show_console = "always",
    cmake_dap_configuration = {
      name = "cpp",
      type = "codelldb",
      request = "launch",
      stopOnEntry = false,
      runInTerminal = true,
      console = "integratedTerminal",
    },
    cmake_executor = {
      name = "overseer",
      opts = {
        on_new_task = function(task)
          require("overseer").open({ enter = false, direction = "bottom" })
        end,
      },
    },
    cmake_runner = {
      name = "overseer",
      opts = {
        on_new_task = function(task)
          require("overseer").open({ enter = false, direction = "bottom" })
        end,
      },
    },
  },
  config = function(_, opts)
    require("cmake-tools").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "objc", "objcpp", "h", "hpp", "cmake" },
      callback = function(event)
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
        end

        map("<leader>cg", "<cmd>CMakeGenerate<cr>", "CMake: Generate (Ninja)")
        map("<leader>cb", "<cmd>CMakeBuild<cr>", "CMake: Build Target")
        map("<leader>cr", "<cmd>CMakeRun<cr>", "CMake: Run Executable")
        map("<leader>cd", "<cmd>CMakeDebug<cr>", "CMake: Debug Target")
        map("<leader>cs", "<cmd>CMakeSelectBuildTarget<cr>", "CMake: Select Target")
        map("<leader>ct", "<cmd>CMakeSelectBuildType<cr>", "CMake: Select Build Type")
      end,
    })
  end,
}

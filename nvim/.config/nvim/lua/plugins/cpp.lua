local cpp_ft = { "c", "cpp", "objc", "objcpp", "cmake" }

return {
  "Civitasv/cmake-tools.nvim",
  ft = cpp_ft,
  keys = {
    { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake: Generate (Ninja)", ft = cpp_ft },
    { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake: Build Target", ft = cpp_ft },
    { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake: Run Executable", ft = cpp_ft },
    { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake: Debug Target", ft = cpp_ft },
    { "<leader>cv", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake: Select Target", ft = cpp_ft },
    { "<leader>ct", "<cmd>CMakeSelectBuildType<cr>", desc = "CMake: Select Build Type", ft = cpp_ft },
    {
      "<leader>ck",
      function()
        vim.ui.input({ prompt = "Launch args: " }, function(input)
          if input and input ~= "" then
            vim.cmd("CMakeLaunchArgs " .. input)
          end
        end)
      end,
      desc = "CMake: Launch Args",
      ft = cpp_ft,
    },
  },
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
        on_new_task = function()
          require("overseer").open({ enter = false, direction = "bottom" })
        end,
      },
    },
    cmake_runner = {
      name = "overseer",
      opts = {
        on_new_task = function()
          require("overseer").open({ enter = false, direction = "bottom" })
        end,
      },
    },
  },
}

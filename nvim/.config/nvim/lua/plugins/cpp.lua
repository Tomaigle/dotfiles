return {
  {
    "Civitasv/cmake-tools.nvim",
    lazy = false,
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
        opts = {},
      },
      cmake_runner = {
        name = "overseer",
        opts = {},
      },
    },
    keys = {
      { "<leader>cg", "<cmd>CMakeGenerate<cr>", desc = "CMake: Generate (Ninja)" },
      { "<leader>cb", "<cmd>CMakeBuild<cr>", desc = "CMake: Build Target" },
      { "<leader>cr", "<cmd>CMakeRun<cr>", desc = "CMake: Run Executable" },
      { "<leader>cd", "<cmd>CMakeDebug<cr>", desc = "CMake: Debug Target" },
      { "<leader>cs", "<cmd>CMakeSelectBuildTarget<cr>", desc = "CMake: Select Target" },
      { "<leader>ct", "<cmd>CMakeSelectBuildType<cr>", desc = "CMake: Select Build Type (Debug/Release)" },
    },
  },
}

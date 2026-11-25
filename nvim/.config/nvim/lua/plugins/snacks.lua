return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      shell = vim.fn.executable("fish") == 1 and "fish" or "bash",
    },
    picker = {
      sources = {
        projects = {
          dev = { "~/Coding", "~/projects", "~/Studia" },
          max_depth = 4,
          patterns = {
            ".git",
            "CMakeLists.txt",
            "pyproject.toml",
            "requirements.txt",
            "Cargo.toml",
            "Makefile",
            "package.json",
            "go.mod",
            ".project",
          },
        },
      },
    },
  },
}

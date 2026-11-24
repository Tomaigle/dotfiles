return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      shell = "fish",
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

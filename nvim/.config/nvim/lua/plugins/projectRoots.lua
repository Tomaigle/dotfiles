return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          projects = {
            dev = { "~/Coding", "~/projects", "~/Studia" },
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
  },
}

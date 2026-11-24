return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "alfaix/neotest-gtest",
    },
    opts = function(_, opts)
      opts.adapters = {
        require("neotest-gtest").setup({
          filter_dir = function(name, rel_path, root)
            return name ~= "build"
          end,
        }),
      }
      return opts
    end,
  },
}

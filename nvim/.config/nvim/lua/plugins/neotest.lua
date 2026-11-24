return {
  {
    "nvim-neotest/neotest",
    dependencies = { "alfaix/neotest-gtest" },
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}
      table.insert(
        opts.adapters,
        require("neotest-gtest").setup({
          filter_dir = function(name)
            return name ~= "build"
          end,
        })
      )
    end,
  },
}

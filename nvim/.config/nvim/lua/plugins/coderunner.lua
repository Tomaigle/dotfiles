return {
  "CRAG666/code_runner.nvim",
  opts = {
    -- You can customize default compiler flags for the plugin here
    -- Check the plugin's GitHub page for the exact syntax
  },
  keys = {
    -- Map the plugin's commands to <leader>cr, <leader>cf, etc.
    { "<leader>cr", "<cmd>RunCode<CR>", desc = "Run Code (Plugin)" },
    { "<leader>cf", "<cmd>RunFile<CR>", desc = "Run File (Plugin)" },
    { "<leader>cp", "<cmd>RunProject<CR>", desc = "Run Project (Plugin)" },
  },
}

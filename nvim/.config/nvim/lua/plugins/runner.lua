return {
  "CRAG666/code_runner.nvim",
  keys = {
    { "<leader>cR", ":RunCode<CR>", desc = "Run Code", mode = "n" },
  },
  opts = {
    mode = "term",
    filetype = {
      python = "python3 -u",
      cpp = "cd $dir && g++ $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
      c = "cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
      rust = "cd $dir && rustc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
    },
  },
}

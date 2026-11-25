return {
  "folke/which-key.nvim",
  opts = {
    -- hide from popup only; keymaps stay active
    filter = function(mapping)
      return not (mapping.desc and mapping.desc:match("^Harpoon to File %d"))
    end,
  },
}

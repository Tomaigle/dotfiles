return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- Affects all pickers
        sources = {
          files = {
            hidden = true, -- Specifically enables hidden/dotfiles in file picker
            ignored = false, -- Optional: set to true to also show .gitignored files
          },
          grep = {
            hidden = true, -- Optional: search inside hidden files
            ignored = false,
          },
        },
      },
    },
  },
}

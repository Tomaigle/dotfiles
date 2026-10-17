return {
  "stevearc/overseer.nvim",
  keys = {
    {
      "<leader>cr",
      function()
        local file = vim.fn.shellescape(vim.fn.expand("%"))
        local file_no_ext = vim.fn.shellescape(vim.fn.expand("%:r"))
        local ft = vim.bo.filetype
        local cmd = ""

        if ft == "python" then
          cmd = "python3 " .. file
        elseif ft == "swift" then
          cmd = "swift " .. file
        elseif ft == "javascript" then
          cmd = "node " .. file
        elseif ft == "sh" then
          cmd = "bash " .. file
        elseif ft == "cpp" then
          cmd = "g++ " .. file .. " -o " .. file_no_ext .. " && ./" .. file_no_ext
        else
          vim.notify("No run command defined for filetype: " .. ft, vim.log.levels.WARN, { title = "Runner" })
          return
        end

        local overseer = require("overseer")
        local task = overseer.new_task({
          name = "Run " .. ft,
          cmd = cmd,
          components = { "default" },
        })
        task:start()
        overseer.open({ enter = true, direction = "bottom" })
      end,
      desc = "Run File in Terminal",
    },
  },
}

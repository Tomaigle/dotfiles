local runner_ft = { "python", "swift", "javascript", "sh", "c", "cpp", "rust" }

return {
  "stevearc/overseer.nvim",
  keys = {
    {
      "<leader>cj",
      function()
        local file = vim.fn.shellescape(vim.fn.expand("%:p"))
        local out = vim.fn.shellescape("/tmp/" .. vim.fn.expand("%:t:r"))
        local ft = vim.bo.filetype

        local cmds = {
          python = (vim.env.VIRTUAL_ENV and (vim.env.VIRTUAL_ENV .. "/bin/python") or "python3") .. " -u " .. file,
          swift = "swift " .. file,
          javascript = "node " .. file,
          sh = "bash " .. file,
          c = "gcc -g -Wall -Wextra " .. file .. " -o " .. out .. " && " .. out,
          cpp = "g++ -std=c++20 -g -Wall -Wextra " .. file .. " -o " .. out .. " && " .. out,
          rust = "rustc " .. file .. " -o " .. out .. " && " .. out,
        }

        local cmd = cmds[ft]
        if not cmd then
          vim.notify("No run command for: " .. ft, vim.log.levels.WARN, { title = "Runner" })
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
      desc = "Run File (Overseer)",
      ft = runner_ft,
    },
  },
}

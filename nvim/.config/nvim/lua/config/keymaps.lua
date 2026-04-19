vim.keymap.set("n", "<leader>r", function()
  vim.cmd("write")

  local file = vim.fn.expand("%")
  local file_no_ext = vim.fn.expand("%:r")
  local ft = vim.bo.filetype
  local cmd = ""

  if ft == "cpp" then
    cmd = string.format("g++ -Wall -std=c++17 '%s' -o /tmp/'%s.out' && /tmp/'%s.out'", file, file_no_ext, file_no_ext)
  elseif ft == "c" then
    cmd = string.format("gcc -Wall '%s' -o /tmp/'%s.out' && /tmp/'%s.out'", file, file_no_ext, file_no_ext)
  elseif ft == "rust" then
    if vim.fn.filereadable("Cargo.toml") == 1 then
      cmd = "cargo run"
    else
      cmd = string.format("rustc '%s' && ./'%s'", file, file_no_ext)
    end
  elseif ft == "python" then
    cmd = "python3 " .. file
  elseif ft == "lua" then
    cmd = "lua " .. file
  elseif ft == "prolog" then
    cmd = "swipl " .. file
  elseif ft == "haskell" then
    cmd = string.format("runghc '%s'", file)
  elseif ft == "asm" then
    cmd = string.format(
      "nasm -f elf64 '%s' -o '%s.o' && ld '%s.o' -o '%s.out' && ./'%s.out'",
      file,
      file_no_ext,
      file_no_ext,
      file_no_ext,
      file_no_ext
    )
  else
    vim.notify("No runner for filetype: " .. ft, vim.log.levels.WARN)
    return
  end
  vim.cmd("botright 20split | term " .. cmd)
  vim.cmd("startinsert")
end, { desc = "Run Code" })

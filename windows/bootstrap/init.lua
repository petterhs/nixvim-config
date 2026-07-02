-- Entry point for native Windows Neovim.
-- Copy or symlink this file to %LOCALAPPDATA%\nvim\init.lua
-- after cloning this repository and running windows/install.ps1.

local export = vim.fs.joinpath(vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h"), "..", "generated", "init.lua")

if vim.fn.filereadable(export) == 0 then
  vim.notify(
    "Missing windows/generated/init.lua. Run: powershell ./windows/install.ps1",
    vim.log.levels.ERROR
  )
  return
end

if vim.version().minor < 12 then
  vim.notify("This export requires Neovim 0.12+ for vim.pack.add().", vim.log.levels.ERROR)
  return
end

dofile(export)

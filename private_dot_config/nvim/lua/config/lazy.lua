local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazy_path
    })
end

vim.opt.rtp:prepend(lazy_path)

-- Manually require `~/.config/nvim/lua/plugins/init.lua` to allow the order
-- of plugin initialization to be specified and preserved. Calling something
-- like `require("lazy").setup("plugins")` would instead require all matches
-- for `~/.config/nvim/lua/plugins/*.lua` in alphabetical order.
local lazy_plugins = require("plugins")

require("lazy").setup(lazy_plugins)

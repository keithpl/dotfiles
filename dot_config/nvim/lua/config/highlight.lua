local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local hl_incsearch = augroup("hl-incsearch", { clear = true })
local hl_yank = augroup("hl-yank", { clear = true })

autocmd("CmdlineEnter", {
    group = hl_incsearch,
    callback = function()
        vim.opt_local.hlsearch = true
    end
})

autocmd("CmdlineLeave", {
    group = hl_incsearch,
    callback = function()
        vim.opt_local.hlsearch = false
    end
})

autocmd("TextYankPost", {
    group = hl_yank,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 100
        })
    end
})

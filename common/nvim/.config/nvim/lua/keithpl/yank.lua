local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local yank_highlight = augroup("yank_highlight", { clear = true })

autocmd("TextYankPost", {
    group = yank_highlight,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 100
        })
    end,
})

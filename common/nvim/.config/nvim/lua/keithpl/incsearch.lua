local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local incsearch = augroup("vimrc-incsearch-highlight", { clear = true })

autocmd({ "CmdlineEnter" }, {
    group = incsearch,
    callback = function()
        vim.opt_local.hlsearch = true
    end
})

autocmd({ "CmdlineLeave" }, {
    group = incsearch,
    callback = function()
        vim.opt_local.hlsearch = false
    end
})

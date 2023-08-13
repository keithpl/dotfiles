-- Automatically resize splits when the neovim window is resized.
local resize_splits = vim.api.nvim_create_augroup("resize-splits", {
    clear = true
})

vim.api.nvim_create_autocmd("VimResized", {
    group = resize_splits,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end
})

-- Temporarily adjust cmdheight to a non-zero value in order to display
-- the 'recording @macro...' message during macro recording. This workaround
-- is only necessary when cmdheight is set to 0.
local cmdheight_macro = vim.api.nvim_create_augroup("cmdheight-macro", {
    clear = true
})

vim.api.nvim_create_autocmd("RecordingEnter", {
    group = cmdheight_macro,
    pattern = "*",
    callback = function()
        vim.opt_local.cmdheight = 1
    end
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    group = cmdheight_macro,
    pattern = "*",
    callback = function()
        vim.schedule(function()
            vim.opt_local.cmdheight = 0
        end)
    end
})

-- Briefly highlight yanked text.
local hl_yank = vim.api.nvim_create_augroup("hl-yank", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
    group = hl_yank,
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 100
        })
    end
})

-- Highlight matched text while typing a search command, remove highlight
-- once the command is executed.
local hl_incsearch = vim.api.nvim_create_augroup("hl-incsearch", {
    clear = true
})

vim.api.nvim_create_autocmd("CmdlineEnter", {
    group = hl_incsearch,
    callback = function()
        vim.opt_local.hlsearch = true
    end
})

vim.api.nvim_create_autocmd("CmdlineLeave", {
    group = hl_incsearch,
    callback = function()
        vim.opt_local.hlsearch = false
    end
})

-- Enable spell checking and text wrapping on specific file types.
local spell_wrap = vim.api.nvim_create_augroup("spell-wrap", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = spell_wrap,
    pattern = {
        "gitcommit",
        "markdown"
    },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end
})

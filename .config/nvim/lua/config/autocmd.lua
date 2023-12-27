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

-- Temporarily adjust cmdheight to a non-zero value to display the
-- "recording @macro..." message during macro recording. This workaround is
-- only necessary when cmdheight is set to 0.
local cmdheight_macro = vim.api.nvim_create_augroup("cmdheight-macro", {
    clear = true
})

local function cmdheight_autocmd(value)
    return {
        group = cmdheight_macro,
        callback = function()
            vim.schedule(function()
                vim.opt_local.cmdheight = value
            end)
        end
    }
end

vim.api.nvim_create_autocmd("RecordingEnter", cmdheight_autocmd(1))
vim.api.nvim_create_autocmd("RecordingLeave", cmdheight_autocmd(0))

-- Highlight matched text while typing a search command, remove highlight
-- once the command is executed.
local hl_incsearch = vim.api.nvim_create_augroup("hl-incsearch", {
    clear = true
})

local function hlsearch_autocmd(value)
    return {
        group = hl_incsearch,
        callback = function()
            vim.opt_local.hlsearch = value
        end
    }
end

vim.api.nvim_create_autocmd("CmdlineEnter", hlsearch_autocmd(true))
vim.api.nvim_create_autocmd("CmdlineLeave", hlsearch_autocmd(false))

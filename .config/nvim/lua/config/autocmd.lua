-- Automatically resize splits when the neovim window is resized.
local resize_splits = vim.api.nvim_create_augroup("resize-splits", {
    clear = true
})

vim.api.nvim_create_autocmd("VimResized", {
    group = resize_splits,
    callback = function()
        local current_tab = vim.fn.tabpagenr()
        vim.cmd("tabdo wincmd =")
        vim.cmd("tabnext " .. current_tab)
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

-- Temporarily adjust cmdheight to a non-zero value to work around some
-- existing bugs with cmdheight=0. The "recording @macro..." message does not
-- display when cmdheight is 0.
local cmdheight_fixes = vim.api.nvim_create_augroup("cmdheight-fixes", {
    clear = true
})

local function cmdheight_autocmd(height)
    return {
        group = cmdheight_fixes,
        callback = function()
            vim.schedule(function()
                vim.opt_local.cmdheight = height
            end)
        end
    }
end

vim.api.nvim_create_autocmd("RecordingEnter", cmdheight_autocmd(1))
vim.api.nvim_create_autocmd("RecordingLeave", cmdheight_autocmd(0))

-- Highlight all matches while searching, remove the search highlight once
-- the search has completed.
-- local hl_search = vim.api.nvim_create_augroup("hl-search", { clear = true })
--
-- local function hlsearch_autocmd(value)
--     return {
--         group = hl_search,
--         pattern = { "/", "?" },
--         callback = function()
--             vim.opt_local.hlsearch = value
--         end
--     }
-- end
--
-- vim.api.nvim_create_autocmd("CmdlineEnter", hlsearch_autocmd(true))
-- vim.api.nvim_create_autocmd("CmdlineLeave", hlsearch_autocmd(false))

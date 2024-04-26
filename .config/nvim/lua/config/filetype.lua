local filetype_settings = vim.api.nvim_create_augroup("filetype-settings", {
    clear = true
})

-- Enable spell checking and word wrapping only on specific file types.
vim.api.nvim_create_autocmd("FileType", {
    group = filetype_settings,
    pattern = {
        "gitcommit",
        "markdown"
    },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.wrap = true
    end
})

-- Aggressively ensure "*.c" and "*.h" files are treated as C sources and not
-- as C++, ObjC, or anybody else who decides to hijack these extensions.
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = filetype_settings,
    pattern = { "*.c", "*.h" },
    callback = function()
        vim.opt_local.filetype = "c"
    end
})

local function set_filetype_indentation(opts)
    vim.api.nvim_create_autocmd("FileType", {
        group = filetype_settings,
        pattern = opts.pattern,
        callback = function()
            vim.opt_local.tabstop = opts.width
            vim.opt_local.shiftwidth = opts.width
            vim.opt_local.expandtab = opts.expandtab
        end
    })
end

set_filetype_indentation({
    pattern = {
        "bash",
        "c",
        "sh",
        "zsh"
    },
    width = 8,
    expandtab = false
})

set_filetype_indentation({
    pattern = {
        "json",
        "lua",
        "python",
        "swayconfig",
        "toml",
        "vim"
    },
    width = 4,
    expandtab = true
})

set_filetype_indentation({
    pattern = {
        "html",
        "xml",
        "yaml"
    },
    width = 2,
    expandtab = true
})

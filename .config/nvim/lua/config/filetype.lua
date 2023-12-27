local function __set_indent_width(width, expand)
    vim.opt_local.tabstop = width
    vim.opt_local.shiftwidth = width
    vim.opt_local.expandtab = expand
end

local function set_indent_width(width)
    return function()
        __set_indent_width(width, false)
    end
end

local function set_indent_width_expand(width)
    return function()
        __set_indent_width(width, true)
    end
end

local custom_filetype = vim.api.nvim_create_augroup("custom-filetype", {
    clear = true
})

local function set_filetype_indent(pattern, callback)
    vim.api.nvim_create_autocmd("FileType", {
        group = custom_filetype,
        pattern = pattern,
        callback = callback
    })
end

-- Enable spell checking and text wrapping on specific file types.
vim.api.nvim_create_autocmd("FileType", {
    group = custom_filetype,
    pattern = {
        "gitcommit",
        "markdown"
    },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end
})

-- Aggressively ensure '*.h' and '*.c' files are treated as C, not C++, ObjC,
-- or anybody else who decides to hijack these extensions.
vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead", "BufNewFile" }, {
    group = custom_filetype,
    pattern = "*.c,*.h",
    callback = function()
        vim.opt_local.filetype = "c"
        vim.opt_local.cindent = true
        vim.opt_local.cinoptions = "(0:0"
    end
})

set_filetype_indent("c",            set_indent_width(8))
set_filetype_indent("sh",           set_indent_width(8))
set_filetype_indent("zsh",          set_indent_width(8))

set_filetype_indent("json",         set_indent_width_expand(4))
set_filetype_indent("lua",          set_indent_width_expand(4))
set_filetype_indent("python",       set_indent_width_expand(4))
set_filetype_indent("swayconfig",   set_indent_width_expand(4))
set_filetype_indent("vim",          set_indent_width_expand(4))

set_filetype_indent("html",         set_indent_width_expand(2))
set_filetype_indent("toml",         set_indent_width_expand(2))
set_filetype_indent("xml",          set_indent_width_expand(2))
set_filetype_indent("yaml",         set_indent_width_expand(2))

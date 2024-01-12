local custom_filetype = vim.api.nvim_create_augroup("custom-filetype", {
    clear = true
})

-- Enable spell checking and text wrapping only on the file types where I
-- actually want it.
vim.api.nvim_create_autocmd("FileType", {
    group = custom_filetype,
    pattern = {
        "gitcommit",
        "markdown"
    },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.wrap = true
    end
})

-- Aggressively ensure '*.c' and "*.h' files are treated as C and not as
-- C++, ObjC, or anybody else who decides to hijack these extensions.
vim.api.nvim_create_autocmd({ "BufWritePost", "BufRead", "BufNewFile" }, {
    group = custom_filetype,
    pattern = "*.c,*.h",
    callback = function()
        vim.opt_local.filetype = "c"
        vim.opt_local.cindent = true
        vim.opt_local.cinoptions = "(0:0"
    end
})

local function __set_indent_width_expand(width, expand)
    vim.opt_local.tabstop = width
    vim.opt_local.shiftwidth = width
    vim.opt_local.expandtab = expand
end

local function set_indent_width_tabs(width)
    return function()
        __set_indent_width_expand(width, false)
    end
end

local function set_indent_width_spaces(width)
    return function()
        __set_indent_width_expand(width, true)
    end
end

local function set_filetype_callback(pattern, callback)
    vim.api.nvim_create_autocmd("FileType", {
        group = custom_filetype,
        pattern = pattern,
        callback = callback
    })
end

set_filetype_callback("bash",       set_indent_width_tabs(8))
set_filetype_callback("c",          set_indent_width_tabs(8))
set_filetype_callback("sh",         set_indent_width_tabs(8))
set_filetype_callback("zsh",        set_indent_width_tabs(8))

set_filetype_callback("json",       set_indent_width_spaces(4))
set_filetype_callback("lua",        set_indent_width_spaces(4))
set_filetype_callback("python",     set_indent_width_spaces(4))
set_filetype_callback("swayconfig", set_indent_width_spaces(4))
set_filetype_callback("toml",       set_indent_width_spaces(4))
set_filetype_callback("vim",        set_indent_width_spaces(4))

set_filetype_callback("html",       set_indent_width_spaces(2))
set_filetype_callback("xml",        set_indent_width_spaces(2))
set_filetype_callback("yaml",       set_indent_width_spaces(2))

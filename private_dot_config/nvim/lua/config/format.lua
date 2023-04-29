local indentation = augroup("indentation", { clear = true })

local function __set_tab_width(width, expand)
    vim.opt_local.tabstop = width
    vim.opt_local.shiftwidth = width
    vim.opt_local.expandtab = expand
end

local function set_tab_width(width)
    return function()
        __set_tab_width(width, false)
    end
end

local function set_tab_width_expand(width)
    return function()
        __set_tab_width(width, true)
    end
end

local function set_filetype_indent(pattern, cb)
    autocmd("FileType", {
        group = indentation,
        pattern = pattern,
        callback = cb
    })
end

autocmd({ "BufWritePost", "BufRead", "BufNewFile" }, {
    group = indentation,
    pattern = "*.c,*.h",
    callback = function()
        vim.opt_local.filetype = "c"
        vim.opt_local.cindent = true
        vim.opt_local.cinoptions = "(0:0"
    end
})

set_filetype_indent("c",            set_tab_width(8))
set_filetype_indent("sh",           set_tab_width(8))
set_filetype_indent("zsh",          set_tab_width(8))
set_filetype_indent("lua",          set_tab_width_expand(4))
set_filetype_indent("python",       set_tab_width_expand(4))
set_filetype_indent("swayconfig",   set_tab_width_expand(4))
set_filetype_indent("vim",          set_tab_width_expand(4))
set_filetype_indent("xml",          set_tab_width_expand(2))
set_filetype_indent("yaml",         set_tab_width_expand(2))

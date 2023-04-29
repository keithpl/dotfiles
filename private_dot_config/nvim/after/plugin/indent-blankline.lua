local res
local indent_blankline

res, indent_blankline = pcall(require, "indent_blankline")
if not res then
    vim.notify("Failed to load lua module: indent-blankline")
    return
end

indent_blankline.setup({
    show_current_context = true
})

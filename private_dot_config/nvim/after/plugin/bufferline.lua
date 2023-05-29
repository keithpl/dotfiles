local res
local bufferline

res, bufferline = pcall(require, "bufferline")
if not res then
    vim.notify("Failed to load lua module: bufferline")
    return
end

bufferline.setup({
    options = {
        separator_style = "slant",
        offsets = {
            {
                filetype = "NvimTree",
                text = "NvimTree",
                highlight = "Directory",
                separator = false
            },

            {
                filetype = "undotree",
                text = "UndoTree",
                separator = false
            }
        }
    },
})

local res
local lualine
local lualine_theme
local devicons

res, lualine = pcall(require, "lualine")
if not res then
    vim.notify("Failed to load lua module: lualine")
    return
end

res, devicons = pcall(require, "nvim-web-devicons")
if not res then
    vim.notify("Failed to load lua module: nvim-web-devicons")
else
    devicons.setup()
end

res, lualine_theme = pcall(require, "lualine.themes.gruvbox-baby")
if not res then
    vim.notify("Failed to load lua module: lualine.themes.gruvbox-baby")
    lualine_theme = "auto"
else
    local tmp
    local gruvbox_baby_colors

    res, tmp = pcall(require, "gruvbox-baby.colors")
    if res then
        gruvbox_baby_colors = tmp.config()
        lualine_theme.normal.c.bg = gruvbox_baby_colors.background_dark
        lualine_theme.inactive.b.bg = gruvbox_baby_colors.background
        lualine_theme.inactive.c.bg = gruvbox_baby_colors.background_dark
    end
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = lualine_theme,
        component_separators = {
            left = "|",
            right = "|"
        },
        section_separators = {
            left = "",
            right = ""
        },
        disabled_filetypes = {
            "undotree",
            "NvimTree"
        }
    }
})

local plugin_table = {}

local function plugin_add(name)
    local res, plugin = pcall(require, name)

    if not res then
        vim.notify("Failed to load lua plugin configuration: " .. name)
        return
    end
    table.insert(plugin_table, plugin)
end

plugin_add("plugins.colorscheme")
plugin_add("plugins.statusline")
plugin_add("plugins.bufferline")
plugin_add("plugins.blankline")
plugin_add("plugins.notifications")
plugin_add("plugins.autocomplete")
plugin_add("plugins.autopairs")
plugin_add("plugins.lsp")
plugin_add("plugins.treeshitter")
plugin_add("plugins.telescope")
plugin_add("plugins.comment")
plugin_add("plugins.nvim-tree")
plugin_add("plugins.undotree")
plugin_add("plugins.fugitive")
plugin_add("plugins.gitsigns")

return plugin_table

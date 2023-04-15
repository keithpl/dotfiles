local res
local cmp
local cmp_window
local luasnip
local autopairs

res, autopairs = pcall(require, "nvim-autopairs")
if res then
    autopairs.setup()
else
    vim.notify("Failed to load lua module: nvim-autopairs")
end

res, cmp = pcall(require, "cmp")
if not res then
    vim.notify("Failed to load lua module: nvim-cmp")
    return
end

res, luasnip = pcall(require, "luasnip")
if not res then
    vim.notify("Failed to load lua module: luasnip")
    return
end

res, cmp_window = pcall(require, "cmp.utils.window")
if not res then
    vim.notify("Failed to load lua module: nvim-cmp.utils.window")
    return
end

local function cmp_border(hl_name)
    return {
        { "╭", hl_name },
        { "─", hl_name },
        { "╮", hl_name },
        { "│", hl_name },
        { "╯", hl_name },
        { "─", hl_name },
        { "╰", hl_name },
        { "│", hl_name }
    }
end

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
    local info = self:info_()

    info.scrollable = false
    return info
end

cmp.setup({
    window = {
        completion = {
            border = cmp_border("CmpBorder"),
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None"
        },
        documentation = {
            border = cmp_border("CmpBorder")
        }
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.config.disable,
        ["<Down>"] = cmp.config.disable,
        ["<C-Up>"] = cmp.mapping.select_prev_item(),
        ["<C-Down>"] = cmp.mapping.select_next_item(),
        ["<S-Up>"] = cmp.mapping.select_prev_item(),
        ["<S-Down>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<S-Tab>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        })
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" }
    }
})

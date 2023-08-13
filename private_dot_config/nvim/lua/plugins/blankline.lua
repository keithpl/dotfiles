local function blankline_config()
    local blankline = require("indent_blankline")

    blankline.setup({
        show_current_context = true
    })
end

return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    config = blankline_config
}

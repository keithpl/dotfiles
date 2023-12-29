local function blankline_config()
    local blankline = require("ibl")

    blankline.setup({})
end

return {
    "lukas-reineke/indent-blankline.nvim",
    lazy = false,
    main = "ibl",
    config = blankline_config
}

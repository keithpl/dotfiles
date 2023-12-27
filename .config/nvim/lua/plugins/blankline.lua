local function blankline_config()
    local blankline = require("ibl")

    blankline.setup()
end

return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    lazy = false,
    config = blankline_config
}

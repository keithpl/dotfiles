local function fidget_config()
    local fidget = require("fidget")

    fidget.setup()
end

return {
    "j-hui/fidget.nvim",
    lazy = false,
    config = fidget_config
}

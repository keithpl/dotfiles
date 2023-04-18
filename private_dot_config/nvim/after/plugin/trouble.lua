local res
local trouble

res, trouble = pcall(require, "trouble")
if not res then
    vim.notify("Failed to load lua module: trouble")
    return
end

trouble.setup()

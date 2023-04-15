local cmdheight_fixes = augroup("cmdheight-fixes", { clear = true })

autocmd("RecordingEnter", {
    group = cmdheight_fixes,
    pattern = "*",
    callback = function()
        vim.opt_local.cmdheight = 1
    end
})

autocmd("RecordingLeave", {
    group = cmdheight_fixes,
    pattern = "*",
    callback = function()
        local timer = vim.loop.new_timer()

        timer:start(10, 0, vim.schedule_wrap(function()
            vim.opt_local.cmdheight = 0
        end))
    end
})

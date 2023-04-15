function augroup(name, opts)
    return vim.api.nvim_create_augroup(name, opts)
end

function autocmd(event, opts)
    return vim.api.nvim_create_autocmd(event, opts)
end

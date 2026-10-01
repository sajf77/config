require "nvchad.autocmds"

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    callback = function()
    vim.highlight.on_yank({
      higroup = "Search",
      timeout = 150,
    })
    end,
})



vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "Open file at the last edit position",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})


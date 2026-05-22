return {
  'braxtons12/blame_line.nvim',
  opts = {
    template = ' <author-time> • <author>', -- template for the blame message, check the Message template section for more options
    date = { relative = true },
    delay = 100,
    show_in_insert = false,
    show_in_visual = false,
  },
  config = function()
    vim.keymap.set('n', '<leader>tg', '<cmd>BlameLineToggle<CR>', { desc = 'Toggle Git-Blame' })
    require('blame_line').disable()
  end,
}

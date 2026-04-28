local M = {
  'ankushbhagats/match.nvim',
  config = function()
    require('match').setup {
      prefix = ' ',
    }

    vim.keymap.set('n', '<leader>mo', '<cmd>Match<CR>', { desc = 'Abrir UI search/replace' })
    vim.keymap.set('n', '<leader>mw', '<cmd>MatchWord<CR>', { desc = 'Abrir search/replace na palavra' })
  end,
}
return M

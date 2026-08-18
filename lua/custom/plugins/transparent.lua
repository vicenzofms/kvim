return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('transparent').setup {
      extra_groups = {
        'TabLine',
        'TabLineFill',
        'TabLineSel',
      },
      exclude_groups = {
        'MiniStatuslineModeNormal',
        'MiniStatuslineModeInsert',
        'MiniStatuslineModeVisual',
        'MiniStatuslineModeReplace',
        'MiniStatuslineModeCommand',
        'MiniStatuslineModeOther',
      },
      -- só roda enquanto o transparent estiver ativo (clear() aborta se estiver
      -- desligado); ao desativar, o :colorscheme que o :TransparentToggle já
      -- dispara restaura os valores originais do tema sozinho
      on_clear = function()
        local dim = '#7a7a7a'

        -- base (o que você já tinha, + LineNr que faltava)
        vim.api.nvim_set_hl(0, 'Comment', { fg = '#a4a4a4', italic = true })
        vim.api.nvim_set_hl(0, 'LineNr', { fg = dim })
        vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = dim })
        vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = dim })
        vim.api.nvim_set_hl(0, 'NonText', { fg = dim })

        -- mini.tabline: aba não selecionada
        vim.api.nvim_set_hl(0, 'MiniTablineHidden', { fg = dim })
        --
        -- Snacks dashboard: texto do footer (stats do lazy.nvim)
        vim.api.nvim_set_hl(0, 'SnacksDashboardFooter', { fg = '#a4a4a4', italic = true })

        -- Snacks smart picker: caminho e linha:coluna
        vim.api.nvim_set_hl(0, 'SnacksPickerDir', { fg = dim })
        vim.api.nvim_set_hl(0, 'SnacksPickerRow', { fg = dim })
        vim.api.nvim_set_hl(0, 'SnacksPickerCol', { fg = dim })

        -- Snacks dashboard: caminhos recentes
        vim.api.nvim_set_hl(0, 'SnacksDashboardFile', { fg = '#a4a4a4' })
        vim.api.nvim_set_hl(0, 'SnacksDashboardDir', { fg = dim })
        vim.api.nvim_set_hl(0, 'SnacksDashboardDesc', { fg = '#a4a4a4' })
      end,
    }

    require('transparent').clear_prefix 'MiniTabline'
    require('transparent').clear_prefix 'MiniStatusline'
    require('transparent').clear_prefix 'SnacksDashboard'
    require('transparent').clear_prefix 'SnacksIndent'
  end,
}

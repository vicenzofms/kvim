return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,

  ---@type snacks.Config
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[



 █████   █████  ███                                                      ██████                         
░░███   ░░███  ░░░                                                      ███░░███                        
 ░███    ░███  ████   ██████   ██████  ████████    █████████  ██████   ░███ ░░░  █████████████    █████ 
 ░███    ░███ ░░███  ███░░███ ███░░███░░███░░███  ░█░░░░███  ███░░███ ███████   ░░███░░███░░███  ███░░  
 ░░███   ███   ░███ ░███ ░░░ ░███████  ░███ ░███  ░   ███░  ░███ ░███░░░███░     ░███ ░███ ░███ ░░█████ 
  ░░░█████░    ░███ ░███  ███░███░░░   ░███ ░███    ███░   █░███ ░███  ░███      ░███ ░███ ░███  ░░░░███
    ░░███      █████░░██████ ░░██████  ████ █████  █████████░░██████   █████     █████░███ █████ ██████ 
     ░░░      ░░░░░  ░░░░░░   ░░░░░░  ░░░░ ░░░░░  ░░░░░░░░░  ░░░░░░   ░░░░░     ░░░░░ ░░░ ░░░░░ ░░░░░░  
        ]],
        keys = {
          { icon = ' ', key = 'f', desc = 'Achar arquivo', action = ":lua Snacks.dashboard.pick('files')" },
          { icon = ' ', key = 'n', desc = 'Novo arquivo', action = ':ene | startinsert' },
          {
            icon = '󰉋 ',
            key = 'e',
            desc = 'Explorador de arquivos',
            action = function()
              Snacks.explorer()
            end,
          },
          { icon = ' ', key = 'g', desc = 'Achar texto', action = ":lua Snacks.dashboard.pick('live_grep')" },
          -- { icon = ' ', key = 'r', desc = 'Recent Files', action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = ' ', key = 'c', desc = 'Ir para Configurações', action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          -- { icon = ' ', key = 's', desc = 'Restore Session', section = 'session' },
          { icon = '󰒲 ', key = 'L', desc = 'Abrir Lazy', action = ':Lazy', enabled = package.loaded.lazy ~= nil },
          { icon = ' ', key = 'q', desc = 'Sair', action = ':qa' },
        },
      },
      sections = {
        { section = 'header' },
        { section = 'keys', padding = 2 },
        { section = 'recent_files', title = 'Arquivos Recentes', icon = ' ', padding = 2 },
        { section = 'startup' },
      },
    },
    explorer = { enabled = true },
    indent = { enabled = true },
    picker = {
      enabled = true,
      exclude = {
        'node_modules',
        'dist',
      },
      sources = {
        smart = {
          title = ' Buscar', -- troca "Smart" por "Buscar" + ícone de lupa
          preview = function(ctx)
            local ok, path = pcall(Snacks.picker.util.path, ctx.item)
            if ok and path then
              local icon = Snacks.util.icon(path, 'file', { fallback = ctx.picker.opts.icons.files })
              ctx.item.preview_title = vim.trim(icon) .. ' ' .. vim.fn.fnamemodify(path, ':t')
            end
            return Snacks.picker.preview.file(ctx)
          end,
        },
        explorer = {
          ignored = true,
          hidden = true,
          title = '󰉋 Arquivos', -- troca o texto de "{title}" (troque o ícone se seu font não tiver esse glyph)
          layout = {
            layout = {
              position = 'right',
              width = 35, -- mais fino (default do preset sidebar é 40)
              min_width = 35,
              box = 'vertical',
              { win = 'input', height = 1, border = true, title = '{title}', title_pos = 'center' },
              { win = 'list', border = 'none' },
              { win = 'preview', title = '{preview}', height = 0.4, border = 'top' },
            },
          },
        },
        grep = {
          preview = function(ctx)
            local ok, path = pcall(Snacks.picker.util.path, ctx.item)
            if ok and path then
              local icon = Snacks.util.icon(path, 'file', { fallback = ctx.picker.opts.icons.files })
              ctx.item.preview_title = vim.trim(icon) .. ' ' .. vim.fn.fnamemodify(path, ':t')
            end
            return Snacks.picker.preview.file(ctx)
          end,
        },
        colorschemes = {
          layout = {
            preset = 'select',
            layout = {
              title = 'Temas & Cores ',
              max_width = 50,
              height = 0.8,
            },
            hidden = {},
          },
          confirm = function(picker, item)
            picker:close()
            if item then
              picker.preview.state.colorscheme = nil
              vim.schedule(function()
                vim.g.CURR_COLO = item.text
                vim.cmd('colorscheme ' .. vim.g.CURR_COLO)
              end)
            end
          end,
        },
      },
    },
    notifier = {
      enabled = true,
      timeout = 3000,
      margin = {
        top = 1,
        right = 1,
        bottom = 0,
      },
      padding = true,
      style = 'compact',
    },
    lazygit = {
      enabled = true,
    },
    scroll = { enabled = true },
  },
  keys = {
    -- Explorer
    {
      '<leader>fe',
      function()
        Snacks.explorer()
      end,
      desc = 'Explorador de Arquivos',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.smart()
      end,
      desc = 'Achar arquivos',
    },
    {
      '<leader>fs',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Achar string',
    },
    {
      '<leader>nn',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Histórico de Notificações',
    },
    -- Lazygit
    {
      '<leader>lg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Abrir LazyGit',
    },
    -- Colorschemes
    {
      '<leader>c',
      function()
        Snacks.picker.colorschemes()
      end,
      desc = 'Abrir temas',
    },
  },
}

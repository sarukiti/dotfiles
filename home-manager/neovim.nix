{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    # Mason が LSP を取得・実行するときに使う（git / 展開 / Node 系サーバ用）
    extraPackages = with pkgs; [
      git
      curl
      wget
      unzip
      gnutar
    ];
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      # lualine のアイコン表示用（先に読み込む）
      nvim-web-devicons
      lualine-nvim
      nvim-lspconfig
      mason-nvim
      mason-lspconfig-nvim
    ];
    initLua = ''
      -- Ghostty などターミナル側の透過が見えるように、エディタの「下地」を透明にする
      local function transparent_background()
        local none = { bg = 'NONE', ctermbg = 'NONE' }
        local set = vim.api.nvim_set_hl
        set(0, 'Normal', none)
        set(0, 'NormalNC', none)
        set(0, 'SignColumn', none)
        set(0, 'FoldColumn', none)
        set(0, 'LineNr', none)
        set(0, 'CursorLineNr', none)
        set(0, 'EndOfBuffer', none)
        set(0, 'NonText', none)
        set(0, 'WinSeparator', { bg = 'NONE', ctermbg = 'NONE' })
        set(0, 'VertSplit', { bg = 'NONE', ctermbg = 'NONE' })
        -- 組み込み :terminal も同じく透過感を揃える
        set(0, 'Terminal', none)
      end

      vim.api.nvim_create_autocmd({ 'ColorScheme', 'VimEnter' }, {
        pattern = '*',
        callback = transparent_background,
      })

      -- 補完・プレビューなどの浮遊 UI を軽く透かす（0〜100、大きいほど背後が見える）
      vim.o.pumblend = 12
      vim.o.winblend = 8

      -- インデント: タブ幅=4、入力はスペース
      vim.o.tabstop = 4
      vim.o.shiftwidth = 4
      vim.o.softtabstop = 4
      vim.o.expandtab = true

      -- Diagnostics（Neovim 0.11 組み込み）
      -- signs は vim.diagnostic.config 経由（sign_define は非推奨）
      vim.diagnostic.config({
        virtual_text = { spacing = 2, source = 'if_many' },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = 'E',
            [vim.diagnostic.severity.WARN] = 'W',
            [vim.diagnostic.severity.INFO] = 'I',
            [vim.diagnostic.severity.HINT] = 'H',
          },
        },
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = { border = 'rounded', source = true },
      })

      -- 診断の前後へ（バッファローカルではなくグローバルで十分なことが多い）
      vim.keymap.set('n', '[d', function()
        vim.diagnostic.jump({ count = -1, float = true })
      end, { desc = '前の診断へ' })
      vim.keymap.set('n', ']d', function()
        vim.diagnostic.jump({ count = 1, float = true })
      end, { desc = '次の診断へ' })
      vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { desc = '診断を浮遊表示' })
      vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, { desc = '診断を location list に' })

      -- Neovim 0.11: 全クライアント共通の補助設定（大きなリポジトリで watch が重い場合の例）
      do
        local caps = vim.lsp.protocol.make_client_capabilities()
        if caps.workspace then
          caps.workspace.didChangeWatchedFiles = nil
        end
        vim.lsp.config('*', {
          capabilities = caps,
        })
      end

      -- Lua（Neovim 設定用）: lua_ls
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = {
              checkThirdParty = false,
              library = vim.api.nvim_get_runtime_file("", true),
            },
            diagnostics = {
              globals = { 'vim' },
            },
          },
        },
      })

      require('mason').setup({
        ui = {
          border = 'rounded',
          icons = {
            package_installed = '✓',
            package_pending = '…',
            package_uninstalled = '○',
          },
        },
      })

      -- ensure_installed は初回起動後に Mason が取得。有効化は vim.lsp.enable（本プラグインが自動）
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'nil_ls',
          'rust_analyzer',
          'pyright',
          'jsonls',
          'bashls',
          'yamlls',
          'ts_ls',
        },
      })

      require('lualine').setup({
        options = {
          theme = 'auto',
          icons_enabled = true,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          globalstatus = true,
          always_divide_middle = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            'branch',
            'diff',
            {
              'diagnostics',
              sources = { 'nvim_diagnostic' },
            },
          },
          lualine_c = {
            {
              'filename',
              path = 1,
              shorting_target = 40,
              symbols = {
                modified = ' ○',
                readonly = ' ',
                unnamed = '[無名]',
                newfile = '[新規]',
              },
            },
          },
          lualine_x = {
            'encoding',
            {
              'fileformat',
              symbols = {
                unix = 'LF',
                dos = 'CRLF',
                mac = 'CR',
              },
            },
            'filetype',
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              'filename',
              path = 1,
            },
          },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        extensions = { 'quickfix' },
      })
    '';
  };
}

if not vim.g.vscode then
  vim.lsp.set_log_level("debug")
  local telescope_builtin = require'telescope.builtin'
  -- vim.keymap.set('i', '<Tab>', vim.cmd([[pumvisible() ? "\<C-n>" : "\<Tab>"]]))
  -- vim.keymap.set('i', '<S-Tab>', vim.cmd([[pumvisible() ? "\<C-p>" : "\<S-Tab>"]]))
  --
  -- Global mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
  -- List diagnostics with telescope (bufnr=0 means only for current buffer)
  vim.keymap.set('n', '<leader>d', telescope_builtin.diagnostics)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

  -- Use LspAttach autocommand to only map the following keys
  -- after the language server attaches to the current buffer
  vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      local opts = { buffer=ev.buf, noremap=true, silent=true }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      vim.keymap.set('n', 'gd', telescope_builtin.lsp_definitions, opts)
      vim.keymap.set('n', 'gt', telescope_builtin.lsp_type_definitions, opts)
      vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, opts)
      vim.keymap.set('n', '<leader>fs', telescope_builtin.lsp_document_symbols, opts)
      vim.keymap.set('n', '<leader>F', function()
        vim.lsp.buf.format { async = true }
      end, opts)
    end,
  })

  -- Set up nvim-cmp.
  local cmp = require('cmp')
  local luasnip = require("luasnip")

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, {"i", "s"}),

      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {"i", "s"}),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  cmp.mapping(function()
      if cmp.get_active_entry() then
          cmp.confirm()
      else
          require'ultimate-autopair.maps.cr'.cmpnewline()
      end
  end)

  local handlers = require('nvim-autopairs.completion.handlers')
  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done({
      filetypes = {
        -- "*" is a alias to all filetypes
        ["*"] = {
          ["("] = {
            kind = {
              cmp.lsp.CompletionItemKind.Function,
              cmp.lsp.CompletionItemKind.Method,
            },
            handler = handlers["*"]
          }
        }
      }
    })
  )


  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  local lspconfig = require'lspconfig'

  lspconfig.clangd.setup{capabilities = capabilities}

  lspconfig.pylsp.setup{
    settings = {
      pylsp = {
        plugins = {
          pycodestyle = {
            ignore = {'W391', 'E402', 'W503', 'E501', 'E266'},
            maxLineLength = 100
          }
        }
      }
    },
    capabilities = capabilities
  }

  lspconfig.gopls.setup{
    cmd = {'gopls'},
    -- on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
    init_options = {
      usePlaceholders = true,
    }
  }

lspconfig.bashls.setup{
  filetypes = { "sh" , "zshrc"}
}
end


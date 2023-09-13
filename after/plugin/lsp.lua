local lsp = require('lsp-zero').preset({})
local util = require('lspconfig.util')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
  }
})

local function prefix_bun(cmd)
    return vim.list_extend({
        "bun",
        "run",
        "--bun",
    }, cmd)
end

util.on_setup = util.add_hook_before(util.on_setup, function(config, user_config)
    if config.cmd then
        config.cmd = prefix_bun(config.cmd)
    end
end)

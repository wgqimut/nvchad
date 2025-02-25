require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>sg", require('telescope.builtin').live_grep, {desc = '[S]earch [G]rep'})
map("n", "<leader>sr", require('telescope.builtin').resume, {desc = '[S]earch [R]esume'})
map("n", "<leader>s.", require('telescope.builtin').oldfiles, {desc = '[S]earch Recent Files'})
map("n", "<leader><leader>", require('telescope.builtin').buffers, {desc = '[ ] Find Existing Buffers'})
map('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

autocmd('LspAttach', {
  callback = function (args)
    vim.schedule(function ()
      map("n", 'gr', require('telescope.builtin').lsp_references,  { buffer = args.buf, desc = '[G]oto [R]eferences'})
      map("n", 'gi', require('telescope.builtin').lsp_implementations,  { buffer = args.buf, desc = '[G]oto [I]mplementation'})
      map("n", 'gd', require('telescope.builtin').lsp_definitions,  { buffer = args.buf, desc = '[G]oto [D]efinition'})
      map("n", '<leader>ds', require('telescope.builtin').lsp_document_symbols, {buffer = args.buf, desc = '[D]ocument [S]ymbol'})
      map("n", '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, {buffer = args.buf, desc = '[W]orkspace [S]ymbol'})
    end)
  end,
})


-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>sg", require('telescope.builtin').live_grep, {desc = '[S]earch [G]rep'})

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

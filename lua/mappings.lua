require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

autocmd('LspAttach', {
  callback = function (args)
    vim.schedule(function ()
      map("n", 'gr', require('telescope.builtin').lsp_references,  { buffer = args.buf, desc = '[G]oto [R]eferences'})
      map("n", 'gi', require('telescope.builtin').lsp_implementations,  { buffer = args.buf, desc = '[G]oto [I]mplementation'})
      map("n", 'gd', require('telescope.builtin').lsp_definitions,  { buffer = args.buf, desc = '[G]oto [D]efinition'})
    end)
  end,
})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

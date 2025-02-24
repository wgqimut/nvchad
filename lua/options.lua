require "nvchad.options"

local o = vim.o
o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
o.cursorline = true

vim.opt.clipboard = 'unnamedplus'
local function my_paste()
  return {
    vim.fn.split(vim.fn.getreg '', '\n'),
    vim.fn.getregtype '',
  }
end
if vim.fn.has 'macunix' == 0 then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy '+',
      ['*'] = require('vim.ui.clipboard.osc52').copy '*',
    },
    paste = {
      ['+'] = my_paste,
      ['*'] = my_paste,
    },
  }
end


-- PLUGINSSSSSS
vim.cmd([[call plug#begin()

Plug 'Mofiqul/adwaita.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'NoahTheDuke/vim-just'
Plug 'VonHeikemen/fine-cmdline.nvim'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'preservim/nerdtree'
Plug 'sQVe/sort.nvim'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-sensible'

call plug#end()]])

-- I don't remember what this does so I'm leaving it here until I miss its functionality
--vim.cmd([[runtime! ftplugin/man.vim]])

-- enable line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- set neovim theme to adwaita (unsupported by nvf directly)
vim.cmd([[let g:adwaita_transparent = v:true]])
vim.cmd([[silent! colorscheme adwaita]])

-- set adwaita theme
vim.g.adwaita_transparent = true
vim.cmd([[silent! colorscheme adwaita]])

-- use adwaita theme for lualine (also unsupported by nvf)
require("lualine").setup({options = {theme = "adwaita"}})

-- add line and column line at cursor
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

-- related to above, modify line appearance when in insert mode
vim.cmd([[au InsertEnter * hi CursorLine gui=underline cterm=underline]])
vim.cmd([[au InsertLeave * hi CursorLine gui=none cterm=none guibg=Grey20]])
vim.cmd([[au InsertEnter * hi CursorColumn gui=none cterm=none guibg=transparent]])
vim.cmd([[au InsertLeave * hi CursorColumn gui=none cterm=none guibg=Grey20]])

-- speed up macros
vim.opt.lazyredraw = true

-- only search case-sensitive if search contains UPPERCASE characters
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- let yank register sync with system clipboard
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }

-- "x" and change operations won't affect clipboard
vim.keymap.set("", "x", "\"_x", { noremap = true})
vim.keymap.set("", "c", "\"_s", { noremap = true})

-- bind redo
vim.keymap.set("", "U", "<C-r>", { noremap = true})

-- only break lines at whitespace, don't break in the middle of words
vim.opt.linebreak = true

-- keep cursor from scrolling to edge of screen
vim.opt.scrolloff = 5

-- don't show vim mode, since lualine does this for us
vim.opt.showmode = false

-- bind FineCmdLine
vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

-- lualine config
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'adwaita',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

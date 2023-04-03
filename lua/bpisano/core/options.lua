local opt = vim.opt

-- Line number
opt.nu = true
opt.relativenumber = true

-- Cursor line
opt.cursorline = true
opt.cursorcolumn = false

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Line wrapping
opt.wrap = false

-- File management
opt.autowrite = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Search
opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Scrolling
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Window split
opt.splitbelow = true
opt.splitright = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus") 

-- Keyword
opt.iskeyword:append("-")

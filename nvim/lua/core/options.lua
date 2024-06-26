vim.opt.autowrite = true -- Enable auto write
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.cmdheight = 1
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.colorcolumn = "120"
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.fillchars = { foldopen = "", foldclose = "", fold = "⸱", foldsep = " ", diff = "╱", eob = " " }
vim.opt.fileencoding = "utf-8"
vim.opt.formatoptions = "jcroqlnt" -- tcqj
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.guifont = "JetBrainsMono Nerd Font:h12"
vim.opt.hlsearch = true
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.laststatus = 3 -- global statusline
vim.opt.linespace = -2
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.numberwidth = 4
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 8 -- Lines of context
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showcmd = false
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.sidescrolloff = 16 -- Columns of context
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.smarttab = true
vim.opt.spelllang = { "en_gb" }
vim.opt.spell = true
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitkeep = "screen"
vim.opt.splitright = true -- Put new windows right of current
vim.opt.swapfile = false
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 50 -- Save swap file and trigger CursorHold
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.wrap = true -- Disable line wrap

vim.opt.smoothscroll = true
vim.g.markdown_recommended_style = 0

vim.g.netrw_banner = 0
vim.g.netrw_mouse = 2

vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "󰌶",
            [vim.diagnostic.severity.HINT] = "",
        },
    },
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "none",
        source = "always",
        header = "",
        prefix = "",
    },
})

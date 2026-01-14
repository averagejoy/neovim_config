---------------- Primeagen remap -------------------------------------------

--Set <leader> to Space
vim.g.mapleader = " "

-- Opens the directory of current buffer (file) if available otherwise pwd
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Extra Primeagen
-- Move a selectected region in virtual mode up/down with K/J
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Append the line below the current with the space between them and cursor remains on the same place
vim.keymap.set('n', 'J', "mzJ`z")

-- Halv page jumping and remaining in the middle of the page
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")

-- Remain search terms in the middle
vim.keymap.set('n', 'n', "nzzzv")
vim.keymap.set('n', 'N', "Nzzzv")

-- Paste over selection without overwriting the yank register 
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Yank to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Delete without yanking i.e. without overwriting the yank register 
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Esc have general better behaviour
vim.keymap.set('i', '<C-c>', "<Esc>")

-- Disable Ex mode
vim.keymap.set('n', 'Q', "<nop>")

-- Format current buffer
vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format()
end)

-- Quickfix list navigation (with recentering)
vim.keymap.set('n', '<C-k>', "<cmd>cnext<CR>zz")
vim.keymap.set('n', '<C-j>', "<cmd>cprev<CR>zz")

-- Location list navigation (with recentering)
vim.keymap.set('n', '<leader>k', "<cmd>lnext<CR>zz")
vim.keymap.set('n', '<leader>j', "<cmd>lprev<CR>zz")

-- Search and replace word under cursor over the whole file
vim.keymap.set(
    "n",
    "<leader>s",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]
)

-- Make current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

local maximized = false

local function maximize()
    if maximized then
        vim.cmd("wincmd=") -- reset all window sizes
        maximized = false
    else
        vim.cmd("wincmd|") -- maximize current window horizontally
        maximized = true
    end
end

local function buffer_delete()
    if vim.bo.buftype == 'terminal' then
        vim.cmd("bd!") -- force close terminal buffers
    else
        vim.cmd("bd")  -- normal buffer close
    end
end

vim.keymap.set("n", "<leader>fs", vim.cmd.w)      -- Save file
vim.keymap.set("n", "<leader>wq", vim.cmd.q)      -- Quit file

vim.keymap.set('n', '<leader>wv', '<C-w>v<C-w>l') -- Vertical split and move to it
vim.keymap.set('n', '<leader>w-', '<C-w>s<C-w>j') -- Horizontal split and move down

-- Move between windows
vim.keymap.set('n', '<leader>wh', '<C-w><C-h>')
vim.keymap.set('n', '<leader>wl', '<C-w><C-l>')
vim.keymap.set('n', '<leader>wk', '<C-w><C-k>')
vim.keymap.set('n', '<leader>wj', '<C-w><C-j>')

-- Close window
vim.keymap.set('n', '<leader>wd', '<C-w>c')

-- Maximize / reset
vim.keymap.set('n', '<leader>wm', maximize)

vim.keymap.set('n', '<leader>bd', buffer_delete)   -- Smart buffer close
vim.keymap.set('n', '<leader><leader>', '<C-^>')   -- Toggle between last two buffers
vim.keymap.set('n', '<leader>BD', ':bufdo bd<CR>') -- Kill all buffers

vim.keymap.set('n', '<leader>;', 'gcc', { remap = true })
vim.keymap.set('v', '<leader>;', 'gc', { remap = true })

vim.keymap.set('n', '<leader>w;', 'm`A;<ESC>``')

vim.keymap.set('n', '<leader>o', 'm`o<ESC>``')                  -- Insert line below, keep cursor
vim.keymap.set('n', '<leader>O', 'm`O<ESC>``')                  -- Insert line above, keep cursor

vim.keymap.set('n', '<leader>gl', ':G log<CR>')                 -- Git log
vim.keymap.set('n', '<leader>gb', ':G blame<CR>')               -- Git blame

vim.keymap.set('n', '<leader>ls', vim.lsp.buf.workspace_symbol) -- search symbols
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)            -- rename symbol
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)      -- show code actions
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.signature_help)   -- function signature

vim.keymap.set('n', '<C-h>', ':silent <C-U>TmuxNavigateLeft<cr>')
vim.keymap.set('n', '<C-l>', ':silent <C-U>TmuxNavigateRight<cr>')
vim.keymap.set('n', '<C-j>', ':silent <C-U>TmuxNavigateDown<cr>')
vim.keymap.set('n', '<C-k>', ':silent <C-U>TmuxNavigateUp<cr>')

-- Remove annoying autoformat

vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

-- Start highlight when searcing, stop on esc, highligt on *

vim.cmd([[nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>]])
vim.keymap.set('n', '<ESC>', ':set nohls<cr>', { silent = true })

vim.api.nvim_create_autocmd("CmdlineEnter", {
    pattern = { "/", "?" },
    command = "set hlsearch",
})

-- Remaps from Practial Vim book

vim.keymap.set('n', '[b', ':bprevious<CR>') -- Go to the previous buffer in the buffer list
vim.keymap.set('n', ']b', ':bnext<CR>')     -- Go to the next buffer in the buffer list
vim.keymap.set('n', '[B', ':bfirst<CR>')    -- Jump to the first buffer in the buffer list
vim.keymap.set('n', ']B', ':blast<CR>')     -- Jump to the last buffer in the buffer list

---------------------------------------------------------------------
-- Command-line mapping: expand %% to current buffer's directory
-- Uses fnameescape to safely handle spaces and special characters
---------------------------------------------------------------------

vim.keymap.set('c', '%%', function()
    return vim.fn.fnameescape(vim.fn.expand('%:h')) .. '/'
end, { expr = true })

--Helper function that returns a directory path ending in '/'
-- This directory is normally the directory of the current file.
local function buf_dir_slash()
    local dir = vim.fn.expand('%:p:h')
    if dir == '' then dir = vim.fn.getcwd() end
    return dir .. '/'
end

-- Helper function that programmatically enters command-line mode
-- and pre-fills it with an Ex command followed by a directory path.
local function feed_cmdline(cmd)
    -- Put you into command-line mode with the text inserted, cursor at end
    vim.fn.feedkeys(':' .. cmd .. ' ' .. buf_dir_slash(), 'n')
end


-- Pre-fill the command line with:  :edit <current-buffer-directory>/
vim.keymap.set('n', '<leader>ew', function() feed_cmdline('edit') end)

-- Pre-fill the command line with:  :split <current-buffer-directory>/
vim.keymap.set('n', '<leader>es', function() feed_cmdline('split') end)

-- Pre-fill the command line with:  :vsplit <current-buffer-directory>/
vim.keymap.set('n', '<leader>ev', function() feed_cmdline('vsplit') end)

-- Pre-fill the command line with:  :tabedit <current-buffer-directory>/
vim.keymap.set('n', '<leader>et', function() feed_cmdline('tabedit') end)

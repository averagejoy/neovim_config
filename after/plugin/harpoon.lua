local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
-- Add the current file to the harpoon list 
vim.keymap.set("n","<leader>a", mark.add_file)
-- Toggle harpoon quick menu
vim.keymap.set("n","<C-e>", ui.toggle_quick_menu)
-- Switch the current window to the file stored at position 1/2/3/4 in harpoon quick menu
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)

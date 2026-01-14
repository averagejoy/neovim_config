-- Open/Close UndoTree window that shows: earlier versions of the file, branches of edits, diverge places in history
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

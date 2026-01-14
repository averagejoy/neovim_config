function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0,"Normal", { bg = "none" }) 
	vim.api.nvim_set_hl(0,"NormalFloat", { bg = "none" })
end

ColorMyPencils()


function TransDis(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)
end

function TransEn(color)
	color = color or "gruvbox"
	vim.cmd.colorscheme(color)

    if os.getenv("TMUX") ~= nil then
        vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
        vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
    end
end


require("gruvbox").setup({
  contrast = "hard", -- can be "hard", "soft" or empty string
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
})

require("rose-pine").setup({
    variant = "moon", -- auto, main, moon, or dawn
    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },
})

require("catppuccin").setup({
    flavour = "macchiato", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "macchiato",
        dark = "mocha",
    },
    no_italic = true, -- Force no italic
})
-- TransEn()

vim.cmd('colorscheme catppuccin')
-- vim.cmd('colorscheme rose-pine')
-- vim.cmd('colorscheme gruvbox')

local luasnip = require("luasnip")

vim.g.mapleader = ' '

local opts = { noremap = true }

vim.keymap.set('n', '<leader>v', ':source ~/.config/nvim/init.lua<CR>', opts)
vim.keymap.set('n', '<Leader>ss', ':setlocal spell!<CR>', opts)
vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)

vim.keymap.set('n', 'zh', 'z10h', opts)
vim.keymap.set('n', 'zl', 'z10l', opts)


vim.keymap.set('n', 'Y', 'y$', opts)

-- "--------------------------
-- " System clipboard bindings
-- "--------------------------
vim.keymap.set('n', '<Leader>y', '"+y', opts)
vim.keymap.set('n', '<Leader>Y', '"+y$', opts)
vim.keymap.set('v', '<Leader>y', '"+y', opts)
vim.keymap.set({ 'n', 'v' }, '<Leader>p', '"+p', opts)

-- "--------------------
-- " Tab/Window bindings
-- "--------------------
vim.keymap.set('n', 'ge', ':tabedit ', opts)
vim.keymap.set('n', '<C-n>', ':tabnew <bar> RnvimrToggle<CR>', opts)

vim.keymap.set('n', '<leader>f', ':RnvimrToggle<CR>', opts)
vim.keymap.set('t', '<C-e>', '<C-\\><C-n>:RnvimrToggle<CR>', opts)
vim.keymap.set('t', '<M-r>', '<C-\\><C-n>:RnvimrResize<CR>', opts)
vim.keymap.set('n', '<Leader>dd', ':DiffSaved<CR>', opts)
vim.keymap.set('n', '<M-Right>', '<ESC>:tabnext<CR>', opts)
vim.keymap.set('n', '<M-Left>', '<ESC>:tabprevious<CR>', opts)

opts = { noremap = true, silent = true }
vim.keymap.set('n', '<Leader><', ':tabmove -1<CR>', opts)
vim.keymap.set('n', '<Leader>>', ':tabmove +1<CR>', opts)

opts = { noremap = true }
--- Telecope/Finding stuff
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts)
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope resume<cr>', opts)
vim.keymap.set('n', '<F3>', ':Rg ', opts)

-- QuickFix stuff
vim.keymap.set('n', '<M-q>', ':copen<CR>', opts)
vim.keymap.set('n', '<M-k>', ':cprev<CR>', opts)
vim.keymap.set('n', '<M-j>', ':cnext<CR>', opts)

-- Luasnip Mappings
vim.keymap.set({ "i", "s", "n" }, "<c-j>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, { silent = true })


-- Dispatch
vim.keymap.set("n", "<Leader>o", ':Dispatch! ~/scripts/opener.sh "%"<CR>', { noremap = true })

-- Source snippets
vim.keymap.set("n", "<Leader>sr", ':source ~/.config/nvim/lua/pluginconf/luasnip.lua<CR>', { noremap = true })

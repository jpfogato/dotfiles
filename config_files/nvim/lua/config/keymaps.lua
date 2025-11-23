-- Custom keymaps file
-- q, s, x -> quit, save, save and quit operations
-- h -> float diagnostic
-- - -> oil file browser
-- b -> buffer navigation
-- w -> window navigation
-- l -> lsp features
-- f -> fzf: fuzzy finding features
-- c -> code modification, code formatter (conform)
-- m -> misc bindings: everything else

-- define which-key groups
local wk = require("which-key")
wk.add({
	{ "<Leader>b", group = "buffer binds" },
	{ "<Leader>c", group = "code mod binds" },
	{ "<Leader>f", group = "find binds" },
	{ "<Leader>l", group = "lsp binds" },
	{ "<Leader>m", group = "misc: everything else" },
	{ "<Leader>fg", group = "find on git" },
	{ "<Leader>fn", group = "find in Neovim" },
	{ "<Leader>w", group = "window binds" },
	{ "<Leader>t", group = "terminal binds" },
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Oil file browser: -
keymap("n", "-", "<cmd>Oil --float<CR>", { desc = "[-] open cwd" })

-- float diagnostics: h
keymap("n", "<Leader>h", function()
	vim.diagnostic.open_float()
end, { desc = "[h] open float diagnostic" })

-- File operations: no preffix
keymap("n", "<Leader>s", ":w<CR>", { desc = "[s]ave file", noremap = true })
keymap("n", "<Leader>q", ":q<CR>", { desc = "[q]uit", noremap = true })
keymap("n", "<Leader>x", ":x<CR>", { desc = "[x] save and quit", noremap = true })

-- Buffer navigation: b prefix
keymap("n", "<Leader>bn", ":bnext<CR>", { desc = "[n]ext buffer", noremap = true })
keymap("n", "<Leader>bp", ":bprevious<CR>", { desc = "[p]revious buffer", noremap = true })
keymap("n", "<Leader>bd", ":bdelete<CR>", { desc = "[d]elete buffer", noremap = true })

-- Window navigation: w prefix
keymap("n", "<Leader>wh", "<C-w>h", { desc = "[h] Window left", noremap = true })
keymap("n", "<Leader>wj", "<C-w>j", { desc = "[j] Window down", noremap = true })
keymap("n", "<Leader>wk", "<C-w>k", { desc = "[k] Window up", noremap = true })
keymap("n", "<Leader>wl", "<C-w>l", { desc = "[l] Window right", noremap = true })

-- Misc: m prefix
-- Clear search highlights
keymap("n", "<Leader>mh", ":nohlsearch<CR>", { desc = "clr search [h]ighlights", noremap = true })

-- Lazy.nvim
keymap("n", "<Leader>mL", ":Lazy<CR>", { desc = "[L] Lazy", noremap = true })
-- Mason
keymap("n", "<Leader>mM", ":Mason<CR>", { desc = "[M]ason", noremap = true })

-- Code changes, formattings, etc.; c prefix
-- code formatter (conform)
keymap("n", "<Leader>cf", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "code [f]ormat" })

-- terminal binds
-- exit terminal insert mode with ESC
keymap("t", "<Esc>", [[<C-\><C-n>]], opts)
-- make Ctrl-hjkl work in terminal like in normal mode
keymap("t", "<C-h>", [[<C-\><C-n><C-w>h]], opts)
keymap("t", "<C-j>", [[<C-\><C-n><C-w>j]], opts)
keymap("t", "<C-k>", [[<C-\><C-n><C-w>k]], opts)
keymap("t", "<C-l>", [[<C-\><C-n><C-w>l]], opts)

-- buffer next/previous
keymap("n", "<Tab>", "<Cmd>bnext<CR>", { noremap = true, silent = true, desc = "next buffer tab" })
keymap("n", "<S-Tab>", "<Cmd>bprevious<CR>", { noremap = true, silent = true, desc = "prev buffer tab" })

-- normal mode
-- moevement
-- h and l behaves like b and w instead of moving char-wise
keymap("n", "h", "b", opts)
keymap("n", "l", "w", opts)
-- but if you press Shift, it should behave normaly
keymap("n", "H", "h", opts)
keymap("n", "L", "l", opts)

-- window resizing
keymap("n", "<C-Up>", "<Cmd>:resize -2<CR>", opts)
keymap("n", "<C-Down>", "<Cmd>:resize +2<CR>", opts)
keymap("n", "<C-Right>", "<Cmd>:vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", "<Cmd>:vertical resize -2<CR>", opts)

-- text editing in Visual Mode:
-- Moving code around (like Alt + Up/Down on vscode)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)
-- indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

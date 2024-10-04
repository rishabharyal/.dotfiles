local options = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")


vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>w", ":NvimTreeFocus<cr>")

vim.keymap.set('n', '<S-l>', '<CMD>bnext<CR>')
vim.keymap.set('n', '<S-h>', '<CMD>bprevious<CR>')
vim.keymap.set('n', '<leader>q', '<CMD>Bdelete<CR>')

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", options)
vim.keymap.set("n", "<C-j>", "<C-w>j", options)
vim.keymap.set("n", "<C-k>", "<C-w>k", options)
vim.keymap.set("n", "<C-l>", "<C-w>l", options)

vim.keymap.set('n', '<Up>', '<Nop>', options)
vim.keymap.set('n', '<Down>', '<Nop>', options)
vim.keymap.set('n', '<Left>', '<Nop>', options)
vim.keymap.set('n', '<Right>', '<Nop>', options)

-- Disable arrow keys in insert mode
--vim.keymap.set('i', '<Up>', '<Nop>', options)
--vim.keymap.set('i', '<Down>', '<Nop>', options)
--vim.keymap.set('i', '<Left>', '<Nop>', options)
--vim.keymap.set('i', '<Right>', '<Nop>', options)

-- Disable arrow keys in visual mode
--vim.keymap.set('v', '<Up>', '<Nop>', options)
--vim.keymap.set('v', '<Down>', '<Nop>', options)
--vim.keymap.set('v', '<Left>', '<Nop>', options)
--vim.keymap.set('v', '<Right>', '<Nop>', options)

local function set_makeprg()
    vim.opt_local.makeprg = "mkdir -p build && cd build && cmake .. -DCMAKE_BUILD_TYPE=Debug && make -j20"
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = {"c", "cpp"},
    callback = set_makeprg
})

local function build_and_debug(args)
    local exec_name = args.args ~= "" and args.args or "main"  -- Replace 'default_executable' with your default
    local exec_path = "lldb ./build/" .. exec_name
    vim.cmd("split | terminal " .. exec_path)
    vim.cmd("startinsert")
end
local function build_and_run(args)
    local exec_name = args.args ~= "" and args.args or "main"  -- Replace 'default_executable' with your default
    local exec_path = "./build/" .. exec_name
    vim.cmd("split | terminal " .. exec_path)
    vim.cmd("startinsert")
end

vim.api.nvim_create_user_command('Run', build_and_run, { nargs = '*' })
vim.api.nvim_create_user_command('Rund', build_and_debug, { nargs = '*' })


vim.api.nvim_set_keymap("n", "<leader>ll", ":Rund<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>rr", ":Run<CR>", {noremap=true})
vim.api.nvim_set_keymap('n', '<leader>ff', [[:let @/ = '\<' .. expand('<cword>') .. '\>'<CR>n]], { noremap = true, silent = true })

-- more in/all objects between 2 characters
local map = vim.keymap.set
for _, char in ipairs { "_", ".", ":", ",", ";", "|", "/", "\\", "*", "+", "%", "`", "?" } do
  for _, mode in ipairs { "x", "o" } do
    map(mode, "i" .. char, (":<C-u>silent! normal! f%sF%slvt%s<CR>"):format(char, char, char))
    map(mode, "a" .. char, (":<C-u>silent! normal! f%sF%svf%s<CR>"):format(char, char, char))
  end
end

-- -------------------------------------------------------
-- command-line
-- -------------------------------------------------------

vim.cmd([[
  cnoremap <c-v> <MiddleMouse>
  cnoremap <S-Insert> <MiddleMouse>
  cnoremap <C-s> <cmd>write<CR>

  " Navigation in command line
  cnoremap <C-h> <Home>
  cnoremap <C-l> <End>
  cnoremap <C-f> <Right>
  cnoremap <C-b> <Left>
  cnoremap <expr> <Up>  pumvisible() ? "\<C-p>" : "\<Up>"
  cnoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
]])

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Recording (see below):
-- keymap("n", "Q", "q", opts)
-- keymap("n", "gQ", "@q", opts)

 -- -------------------------------------------------------
  -- Tab shift
  -- -------------------------------------------------------

  keymap('x', '<', '<gv', opts)
  keymap('x', '>', '>gv|', opts)
  keymap('x', '<S-Tab>', '<gv', opts)
  keymap('x', '<Tab>', '>gv|', opts)
  keymap('n', '<', '<<_', opts)
  keymap('n', '>', '>>_', opts)

-- -------------------------------------------------------
-- TODO:
-- -------------------------------------------------------

  keymap("n", "<F6>", [[<cmd> lua require("user.utils").openExtApp()<CR>]], {})
  keymap("n", "gx", [[<cmd> lua require("user.utils").openExtApp()<CR>]], {})

  -- code_jump
  vim.api.nvim_set_keymap('n', '<C-BS>', '<C-o>', {noremap=false})
  vim.api.nvim_set_keymap('n', '<M-left>', '<C-o>', {noremap=false})
  vim.api.nvim_set_keymap('n', '<M-right>', '<C-i>', {noremap=false})

  -- comment
  vim.api.nvim_set_keymap("n", [[<C-§>]], [[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").call("toggle_linewise_count_op")<CR>g@$']], { noremap = true, silent = true, expr = true })
  vim.keymap.set("n", [[<C-§>]], [[v:count == 0 ? '<CMD>lua require("Comment.api").call("toggle_current_linewise_op")<CR>g@$' : '<CMD>lua require("Comment.api").call("toggle_linewise_count_op")<CR>g@$']], {desc=''})

  -- floating window
  -- vim.api.nvim_set_keymap('', '<F2>', '<Cmd>lua require("user.utils").toggle_term()<CR>', {noremap=false})
  -- vim.api.nvim_set_keymap('', '<c-t>', '<Cmd>lua require("user.utils").toggle_term()<CR>', {noremap=false})
  -- vim.cmd([[
  --   vnoremap <silent><leader>x :'<,'>lua require('user.utils').excecute_code('visual_lines')<CR>
  --   nnoremap <silent><leader>x <cmd>lua require('user.utils').excecute_code('single_line')<CR>
  --   vnoremap <silent><c-x> :'<'> lua require('user.utils').excecute_code('visual_selection')<CR>
  --   inoremap <silent><c-x> <cmd>lua require('user.utils').excecute_code('single_line')<CR>  
  --   nnoremap <silent><c-x> <cmd>lua require('user.utils').excecute_code('single_line')<CR>
  --   " TODO: run file command for ipython
  --   " 2TermExec cmd="git status" dir=~/<my-repo-path>
  -- ]])
  -- vim.api.nvim_set_keymap('n', "<F5>", [[<cmd>lua require('user.utils').execute_file()<CR>]], opts)

return {
  n = {
    -- disable default bindings
    -- ["<C-Down>"] = false,
    -- ["<C-Left>"] = false,
    -- ["<C-Right>"] = false,
    -- ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["<"] = false,
    [">"] = false,
    ["<leader>c"] = false,
    ["<leader>h"] = false,
    ["<C-\\>"] = false,
    ["<leader>fh"] = false,
    ["<leader>fm"] = false,
    ["<leader>fn"] = false,
    ["<leader>fo"] = false,
    ["<leader>sb"] = false,
    ["<leader>sc"] = false,
    ["<leader>sh"] = false,
    ["<leader>sk"] = false,
    ["<leader>sm"] = false,
    ["<leader>sn"] = false,
    ["<leader>sr"] = false,
    ["<b"] = false,
    [">b"] = false,
    -- resize with arrows
    -- ["<Up>"] = { function() require("smart-splits").resize_up(2) end, desc = "Resize split up" },
    -- ["<Down>"] = { function() require("smart-splits").resize_down(2) end, desc = "Resize split down" },
    -- ["<Left>"] = { function() require("smart-splits").resize_left(2) end, desc = "Resize split left" },
    -- ["<Right>"] = { function() require("smart-splits").resize_right(2) end, desc = "Resize split right" },
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
    -- easy splits
    ["\\"] = { "<cmd>split<cr>", desc = "Horizontal split" },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },
    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- Treesitter Surfer
    ["<m-down>"] = { "<cmd>STSSwapDownNormal<cr>", desc = "Swap next tree-sitter object" },
    ["<m-right>"] = { "<cmd>STSSwapDownNormal<cr>", desc = "Swap next tree-sitter object" },
    ["<m-up>"] = { "<cmd>STSSwapUpNormal<cr>", desc = "Swap previous tree-sitter object" },
    ["<m-left>"] = { "<cmd>STSSwapUpNormal<cr>", desc = "Swap previous tree-sitter object" },
    -- recording
    ["Q"] = {"q", desc = "Record"},
    ["gQ"] = {"@q", desc = "Record"},
    -- close buffers

    -- time stamps
    ["<F4>"] = { '=strftime("%Y-%m-%d")<CR>P', desc = "Time stamp"},
    -- spell
    ["[z"] = {"[sz=", desc = "Correct previous spell", noremap = true, silent = true },
    ["]z"] = {"]sz=", desc = "Correct next spell", noremap = true, silent = true },
    -- Miscellenuous
    ["<C-u>"] = {":undo<cr>", desc = "Undo"},
  },
  i = {
    -- type template string
    [";mk"] = { "<++>", desc = "Insert template string" },
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
     -- keymap("n" ,"<F4>", '=strftime("%Y-%m-%d")<CR>P', opts)
  -- keymap("n" ,"<leader><F4>", '=strftime("%H:%M")<CR>P', opts)
    ["<F4>"] = { '<C-R>=strftime("%Y-%m-%d")<CR>', desc = "Time stamp"},
  },
  v = {
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
  },
  -- terminal mappings
  t = {
    -- ["<esc>"] = false,
    ["jk"] = false,
    ["<c-q>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
    ["<c-n>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
    ["<esc>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
  },
  x = {
    -- better increment/decrement
    ["+"] = { "g<c-a>", desc = "Increment number" },
    ["-"] = { "g<c-x>", desc = "Descrement number" },
    -- line text-objects
    ["il"] = { "g_o^", desc = "Inside line text object" },
    ["al"] = { "$o^", desc = "Around line text object" },
    -- Tressitter Surfer
    ["J"] = { "<cmd>STSSelectNextSiblingNode<cr>", desc = "Surf next tree-sitter object" },
    ["K"] = { "<cmd>STSSelectPrevSiblingNode<cr>", desc = "Surf previous tree-sitter object" },
    ["H"] = { "<cmd>STSSelectParentNode<cr>", desc = "Surf parent tree-sitter object" },
    ["L"] = { "<cmd>STSSelectChildNode<cr>", desc = "Surf child tree-sitter object" },
    ["<m-j>"] = { "<cmd>STSSwapNextVisual<cr>", desc = "Surf next tree-sitter object" },
    ["<m-l>"] = { "<cmd>STSSwapNextVisual<cr>", desc = "Surf next tree-sitter object" },
    ["<m-k>"] = { "<cmd>STSSwapPrevVisual<cr>", desc = "Surf previous tree-sitter object" },
    ["<m-h>"] = { "<cmd>STSSwapPrevVisual<cr>", desc = "Surf previous tree-sitter object" },
  },
  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
  },
  [""] = {
    ["<c-e><c-e>"] = { "<Plug>SendLine", desc = "Send line to REPL" },
    ["<c-e>"] = { "<Plug>Send", desc = "Send to REPL" },
    ['<c-PageUp>'] = { "<Cmd>BufferLineCyclePrev<CR>" },
    ['<c-PageDown>'] = { "<Cmd>BufferLineCycleNext<CR>" },
    ["<C-s>"] = {":w!<cr>", desc = 'Save'},
  },
}


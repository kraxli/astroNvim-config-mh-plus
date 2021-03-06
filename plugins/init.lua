return {
  ["declancm/cinnamon.nvim"] = { disable = true },
  ["famiu/bufdelete.nvim"] = { disable = true },
  -- ["goolord/alpha-nvim"] = { disable = true },
  ["lukas-reineke/indent-blankline.nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },
  ["numToStr/Comment.nvim"] = { disable = true },
  ["EdenEast/nightfox.nvim"] = {
    config = function() require("nightfox").setup(require "user.plugins.nightfox") end,
  },
  ["danymat/neogen"] = {
    module = "neogen",
    cmd = "Neogen",
    config = function() require("neogen").setup(require "user.plugins.neogen") end,
    requires = "nvim-treesitter/nvim-treesitter",
  },
  ["dhruvasagar/vim-table-mode"] = {
    cmd = "TableModeToggle",
    config = function() vim.g.table_mode_corner = "|" end,
  },
  ["echasnovski/mini.nvim"] = {
    event = "VimEnter",
    config = function() require "user.plugins.mini"() end,
  },
  ["ethanholz/nvim-lastplace"] = {
    event = "BufRead",
    config = function() require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace") end,
  },
  ["folke/zen-mode.nvim"] = {
    cmd = "ZenMode",
    module = "zen-mode",
    config = function() require("zen-mode").setup(require "user.plugins.zen-mode") end,
  },
  ["hrsh7th/cmp-calc"] = {
    after = "nvim-cmp",
    config = function() astronvim.add_user_cmp_source "calc" end,
  },
  ["hrsh7th/cmp-emoji"] = {
    after = "nvim-cmp",
    config = function() astronvim.add_user_cmp_source "emoji" end,
  },
  ["jbyuki/nabla.nvim"] = { module = "nabla" },
  ["jc-doyle/cmp-pandoc-references"] = {
    after = "nvim-cmp",
    config = function() astronvim.add_user_cmp_source "pandoc_references" end,
  },
  ["jose-elias-alvarez/typescript.nvim"] = {
    after = "nvim-lsp-installer",
    config = function() require("typescript").setup(require "user.plugins.typescript") end,
  },
  ["kdheepak/cmp-latex-symbols"] = {
    after = "nvim-cmp",
    config = function() astronvim.add_user_cmp_source "latex_symbols" end,
    -- ft = "tex",
  },
  ["lukas-reineke/headlines.nvim"] = {
    ft = { "markdown", "rmd" },
    config = function() require("headlines").setup(require "user.plugins.headlines") end,
  },
  ["mfussenegger/nvim-dap"] = {
    module = "dap",
    config = require "user.plugins.dap",
  },
  ["mickael-menu/zk-nvim"] = {
    module = { "zk", "zk.commands" },
    config = function() require("zk").setup(require "user.plugins.zk") end,
  },
  ["mtikekar/nvim-send-to-term"] = {
    cmd = "SendHere",
    config = function() vim.g.send_disable_mapping = true end,
  },
  ["nanotee/sqls.nvim"] = { module = "sqls" },
  ["phaazon/hop.nvim"] = {
    cmd = { "HopChar1", "HopChar2", "HopLine", "HopPattern", "HopWord" },
    branch = "v1",
    config = function() require("hop").setup() end,
  },
  ["rcarriga/nvim-dap-ui"] = {
    after = "nvim-dap",
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dapui.setup(require "user.plugins.dapui")
      -- add listeners to auto open DAP UI
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },
  ["nvim-treesitter/nvim-treesitter-textobjects"] = { after = "nvim-treesitter" },
  ["nvim-telescope/telescope-bibtex.nvim"] = {
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "bibtex" end,
  },
  ["nvim-telescope/telescope-file-browser.nvim"] = {
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "file_browser" end,
  },
  ["nvim-telescope/telescope-hop.nvim"] = {
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "hop" end,
  },
  ["nvim-telescope/telescope-media-files.nvim"] = {
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "media_files" end,
  },
  ["nvim-telescope/telescope-project.nvim"] = {
    after = "telescope.nvim",
    config = function() require("telescope").load_extension "project" end,
    -- event = "BufWinEnter",
  },
  ["p00f/clangd_extensions.nvim"] = {
    after = "nvim-lsp-installer",
    config = function() require("clangd_extensions").setup(require "user.plugins.clangd_extensions") end,
  },
  ["vitalk/vim-simple-todo"] = {
    keys = {
      "<Plug>(simple-todo-above)",
      "<Plug>(simple-todo-below)",
      "<Plug>(simple-todo-mark-as-done)",
      "<Plug>(simple-todo-mark-as-undone)",
      "<Plug>(simple-todo-mark-switch)",
      "<Plug>(simple-todo-new-list-item)",
      "<Plug>(simple-todo-new-list-item-start-of-line)",
    },
    config = function() vim.g.simple_todo_map_keys = false end,
  },
  -- ["wakatime/vim-wakatime"] = { event = "BufEnter" },
  ["ziontee113/syntax-tree-surfer"] = {
    cmd = {
      "STSSwapUpNormal",
      "STSSwapDownNormal",
      "STSSelectCurrentNode",
      "STSSelectMasterNode",
      "STSSelectParentNode",
      "STSSelectChildNode",
      "STSSelectPrevSiblingNode",
      "STSSelectNextSiblingNode",
      "STSSwapNextVisual",
      "STSSwapPrevVisual",
    },
    config = function() require("syntax-tree-surfer").setup(require "user.plugins.syntax-tree-surfer") end,
  },

  ------------------------------------------------------------------
  -- General
  ------------------------------------------------------------------
  {
    "romainl/vim-cool", -- disables search highlighting when you are done
    event = { "CursorMoved", "InsertEnter" },
  },

  {
    "andweeb/presence.nvim",
    config = function()
      require("user.plugins.presence").config()
    end,
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("user.plugins.todo_comments").config()
    end,
    event = "BufRead",
  },

   -- Scrollbar.
  {
    "dstein64/nvim-scrollview",
    cond = vim.fn.exists('g:fvim_loaded') ~= 1,
    -- disable = vim.fn.exists('g:fvim_loaded'),
    event = "BufRead",
    config = function()
      require("user/plugins/nvim-scroll")
    end,
  },
  {
    "folke/trouble.nvim",
    config = function()
      require("trouble").setup {
        auto_open = false,
        auto_close = true,
        padding = false,
        height = 10,
        use_diagnostic_signs = true,
      }
    end,
    cmd = {"Trouble", "TroubleToggle"},
  },
  -- {
  --   "ggandor/lightspeed.nvim",
  --   config = function()
  --     require("user.plugins.lightspeed").config()
  --   end,
  --   -- disable = true,
  -- },
  -- {
  --   "phaazon/hop.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("user.plugins.hop").config()
  --   end,
  --   -- disable = true,
  -- },
  {
    "kevinhwang91/nvim-bqf",
    config = function()
      require("user.plugins.bqf").config()
    end,
    event = "BufRead",
  },
  {
    'machakann/vim-sandwich',
    keys = {'s'},
    event = "BufReadPost",
    config = function()
      require('user.plugins.sandwich')
    end,
  },
  -- alternative: machakann/vim-sandwich
  {
    'appelgriebsch/surround.nvim',
    disable = 1,
    keys = {'s'},
    event = "BufReadPost",
    config = function()
      require('user.plugins.surround-nvim')
    end,
  },

  -- {
  -- "gfeiyou/command-center.nvim",
  -- requires = { "nvim-telescope/telescope.nvim" }
  -- },

  ------------------------------------------------------------------
  -- Cmp / comple
  ------------------------------------------------------------------

  -- {
  --   "tzachar/cmp-tabnine",
  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-cmp",
  --   after = "nvim-cmp",
  --   config = function()
  --     local tabnine = require "cmp_tabnine.config"
  --     tabnine:setup {
  --       max_lines = 1000,
  --       max_num_results = 10,
  --       sort = true,
  --     }
  --   end,
  --   opt = true,
  --   event = "InsertEnter",
  -- },
  -- {
  --   "hrsh7th/cmp-cmdline",
  --   after = "nvim-cmp",
  --   event = "InsertEnter",
  -- },

  ------------------------------------------------------------------
  -- Telescope
  ------------------------------------------------------------------
  {
    'tknightz/telescope-termfinder.nvim',
    config = function()
     require('telescope').load_extension("termfinder")
    end,
  },
  ------------------------------------------------------------------
  -- Git / diff
  ------------------------------------------------------------------
  {
    "sindrets/diffview.nvim",
    opt = true,
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    module = "diffview",
    keys = "<leader>gd",
    setup = function()
      -- require("which-key").register { ["<leader>gd"] = "diffview: diff HEAD" }
    end,
    config = function()
      require("diffview").setup {
        enhanced_diff_hl = true,
        key_bindings = {
          file_panel = { q = "<Cmd>DiffviewClose<CR>" },
          view = { q = "<Cmd>DiffviewClose<CR>" },
        },
      }
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
  {
    "TimUntersberger/neogit",
    requires = {'nvim-lua/plenary.nvim', 'diffview.nvim'},
    cmd = 'Neogit',
    -- config = function ()
    --   require('config.plugins.neogit')
    -- end
  },
  -- {
  --   'chentau/marks.nvim',
  --   requires = "gitsigns.nvim",
  --   event = "FileType",
  --   config = function ()
  --     require('user.plugins.marks')
  --   end
  -- },

  ------------------------------------------------------------------
  -- LSP / DAP
  ------------------------------------------------------------------

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    -- event = { "BufRead", "BufNew" },
    config = function()
      require("lsp_signature").setup()
      -- require("user.plugins.lsp_signature").config()
    end,
  },
  {
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
    event = "BufReadPost", -- FileType BufRead
    cmd = {"ToggleDiag"},
  },

  -- R support
  {"jalvesaq/Nvim-R", ft='R',},

  -- cwd to the project's root directory
  {
    "ahmedkhalf/lsp-rooter.nvim",
    event = "BufRead",
    config = function()
      require("lsp-rooter").setup()
    end,
  },

  -- lua in Neovim debug support
  {
    "jbyuki/one-small-step-for-vimkind",
    ft = { "lua" },
    -- setup = function() require("config.plugins.dap") end,
  },
  {
    "Pocco81/dap-buddy.nvim",
    -- run = vim.fn.stdpath('data') ..'/site/pack/packer/opt/dap-buddy.nvim/make',
    after = "nvim-dap",
    -- config = function()
    --   require("plugins/dap")
    -- end,
    disable=true,
  },

  -- -------------------------------------------------------
  -- Coding
  -- -------------------------------------------------------

  -- TODO: improve / refine setup and harpoon integration
  -- see also: is0n/jaq-nvim and numToStr/FTerm.nvim
  {
    'CRAG666/code_runner.nvim',
    cmd = {"RunCode", "RunFile", "RunClose", "RunProject", "CRFiletype", "CRProjects", },
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('user.plugins.code_runner')
    end,
  },

  -- TODO: activate
  {
    'michaelb/sniprun',
    run = 'bash ./install.sh',
    disable=true
  },

  -- kassio/neoterm
  -- skywind3000/asyncrun.vim
  -- dccsillag/magma-nvim
  -- rafcamlet/nvim-luapad
  -- https://www.maxwellrules.com/misc/nvim_jupyter.html ??

  -- -------------------------------------------------------
  -- Colorschemes
  -- -------------------------------------------------------
  { "Th3Whit3Wolf/one-nvim"}, -- lazy by nature
  { 'sonph/onehalf', rtp = 'vim', },
  { 'NLKNguyen/papercolor-theme' },

  -- -------------------------------------------------------
  -- Markdown, Note taking, Writing
  -- -------------------------------------------------------
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    -- run = "cd app && npm install",  -- does not seem to work on windows
    ft = "markdown",
    config = function ()
      require("user.plugins.vim-markdown").markdown_preview()
    end
  },
  {
    'renerocksai/calendar-vim',  -- TODO: lazy loading ft or cmd
  },
  -- { 'mracos/mermaid.vim', ft = {'markdown', 'vimwiki', 'mermaid'} },
  { 'chazmcgarvey/vim-mermaid', ft = {'markdown', 'vimwiki', 'mermaid'} },
  {
    'godlygeek/tabular',
    ft = {'markdown', 'vimwiki'},
  },
  -- {
  --   'preservim/vim-markdown',
  --   ft = {'markdown'},
  --   config = function()
  --     require("user.plugins.vim-markdown")
  --   end,
  -- },

  -- TODO:
  {
    "renerocksai/telekasten.nvim",
    ft = {'markdown', 'vimwiki', 'text'},
    cmd = {'Telekasten', 'Tk'},
    keys = {'<leader>z'},
    config = function ()
      vim.cmd([[
        command! Tk :Telekasten
      ]])
      require("user.plugins.telekasten")
    end,
  },
  {
    "lervag/vimtex",
    ft = "tex",
    setup = function ()
      require('user.plugins.vimtex')
    end
  },
  {
    "ekickx/clipboard-image.nvim",
    cmd = "PasteImg",
    ft = {'markdown', 'text', 'vimwiki'},
    config = function ()
      require('user.plugins.clipboard-image')
    end
  },

  {'nvim-orgmode/orgmode',
    ft = {'org'},
    after = 'nvim-treesitter',
    config = function()
      require('user.plugins.orgmode')
      -- require('orgmode').setup{}
    end,
    disable=true,
  },
  {
    "nvim-neorg/neorg",
    config = function ()
      require('neorg').setup {
      }
    end,
  },

  -- TODO: vimwiki
  {
    'vimwiki/vimwiki',
    -- map = { "n: <Plug>" },
    ft = { 'vimwiki', 'markdown', 'vimwiki.markdown' },
    cmd  = { 'VimwikiIndex', 'VimwikiUISelect' },
    setup = function ()
      require('user.plugins.vimwiki')
    end,
  },

  -- {
  --   'masukomi/vim-markdown-folding',
  --   ft = { 'vimwiki', 'markdown', 'vimwiki.markdown' },
  --   setup = function()
  --     -- NestedMarkdownFolds()
  --     -- vim.cmd([[
  --       -- " autocmd FileType vimwiki.markdown,vimwiki,markdown,text set foldmethod=expr foldexpr=NestedMarkdownFolds()
  --     -- ]])
  --   end
  -- },

  -- { 'anuvyklack/pretty-fold.nvim',
  --    requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
  --    config = function()
  --       require('pretty-fold').setup()
  --       require('pretty-fold.preview').setup()
  --    end
  -- },

  -- #######################################################
  -- LUNARVIM / ABZCODING
  -- #######################################################
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_enabled = 1
      vim.g.matchup_surround_enabled = 1
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  -- {
  --   "simrat39/rust-tools.nvim",
  --   config = function()
  --     require("user.rust_tools").config()
  --   end,
  --   ft = { "rust", "rs" },
  -- },
  -- {
  --   "folke/zen-mode.nvim",
  --   config = function()
  --     require("user.zen").config()
  --   end,
  --   event = "BufRead",
  -- },
  -- {
  --   "windwp/nvim-spectre",
  --   event = "BufRead",
  --   config = function()
  --     require("user.spectre").config()
  --   end,
  -- },
  -- {
  --   "folke/persistence.nvim",
  --   event = "BufReadPre",
  --   module = "persistence",
  --   config = function()
  --     require("persistence").setup {
  --       dir = vim.fn.expand(get_cache_dir() .. "/sessions/"), -- directory where session files are saved
  --       options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
  --     }
  --   end,
  -- },
  -- {
  --   "andweeb/presence.nvim",
  --   config = function()
  --     require("user.presence").config()
  --   end,
  -- },
  -- { "mfussenegger/nvim-jdtls", ft = "java" },
  -- {
  --   "kristijanhusak/orgmode.nvim",
  --   keys = { "go", "gC" },
  --   ft = { "org" },
  --   config = function()
  --     require("user.orgmode").setup()
  --   end,
  -- },
  -- {
  --   "danymat/neogen",
  --   config = function()
  --     require("neogen").setup {
  --       enabled = true,
  --     }
  --   end,
  --   event = "InsertEnter",
  --   requires = "nvim-treesitter/nvim-treesitter",
  -- },
  -- {
  --   "vim-test/vim-test",
  --   cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
  --   config = function()
  --     require("user.vim_test").config()
  --   end,
  -- },
  -- {
  --   "jose-elias-alvarez/nvim-lsp-ts-utils",
  --   ft = {
  --     "javascript",
  --     "javascriptreact",
  --     "javascript.jsx",
  --     "typescript",
  --     "typescriptreact",
  --     "typescript.tsx",
  --   },
  --   opt = true,
  --   event = "BufReadPre",
  --   before = "williamboman/nvim-lsp-installer",
  -- },
  -- {
  --   "rcarriga/vim-ultest",
  --   cmd = { "Ultest", "UltestSummary", "UltestNearest" },
  --   wants = "vim-test",
  --   requires = { "vim-test/vim-test" },
  --   run = ":UpdateRemotePlugins",
  --   opt = true,
  --   event = { "BufEnter *_test.*,*_spec.*" },
  -- },
  -- {
  --   "akinsho/flutter-tools.nvim",
  --   requires = "nvim-lua/plenary.nvim",
  --   config = function()
  --     require("user.flutter_tools").config()
  --   end,
  --   ft = "dart",
  -- },
  -- {
  --   "RishabhRD/nvim-cheat.sh",
  --   requires = "RishabhRD/popfix",
  --   config = function()
  --     vim.g.cheat_default_window_layout = "vertical_split"
  --   end,
  --   opt = true,
  --   cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
  --   keys = "<leader>?",
  -- },
  -- {
  --   "AckslD/nvim-neoclip.lua",
  --   config = function()
  --     require("user.neoclip").config()
  --   end,
  --   opt = true,
  --   keys = "<leader>y",
  --   requires = neoclip_req,
  -- },
  -- {
  --   "gelguy/wilder.nvim",
  --   -- event = { "CursorHold", "CmdlineEnter" },
  --   rocks = { "luarocks-fetch-gitrec", "pcre2" },
  --   requires = { "romgrk/fzy-lua-native" },
  --   config = function()
  --     vim.cmd(string.format("source %s", "~/.config/lvim/vimscript/wilder.vim"))
  --   end,
  --   run = ":UpdateRemotePlugins",
  -- },
  -- {
  --   "kristijanhusak/vim-dadbod-completion",
  -- },
  -- {
  --   "kristijanhusak/vim-dadbod-ui",
  --   cmd = {
  --     "DBUIToggle",
  --     "DBUIAddConnection",
  --     "DBUI",
  --     "DBUIFindBuffer",
  --     "DBUIRenameBuffer",
  --   },
  --   requires = {
  --     {
  --       "tpope/vim-dadbod",
  --       opt = true,
  --     },
  --   },
  --   opt = true,
  -- },
  -- {
  --   "karb94/neoscroll.nvim",
  --   config = function()
  --     require("neoscroll").setup {
  --       easing_function = "quadratic",
  --     }
  --   end,
  --   event = "BufRead",
  -- },
  -- {
  --   "github/copilot.vim",
  --   config = function()
  --     require("user.copilot").config()
  --   end,
  -- },
  -- {
  --   "ThePrimeagen/harpoon",
  --   requires = {
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-lua/popup.nvim" },
  --   },
  -- },
  -- {
  --   "sindrets/diffview.nvim",
  --   opt = true,
  --   cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  --   module = "diffview",
  --   keys = "<leader>gd",
  --   setup = function()
  --     require("which-key").register { ["<leader>gd"] = "diffview: diff HEAD" }
  --   end,
  --   config = function()
  --     require("diffview").setup {
  --       enhanced_diff_hl = true,
  --       key_bindings = {
  --         file_panel = { q = "<Cmd>DiffviewClose<CR>" },
  --         view = { q = "<Cmd>DiffviewClose<CR>" },
  --       },
  --     }
  --   end,
  -- },
  -- {
  --   "chipsenkbeil/distant.nvim",
  --   opt = true,
  --   run = { "DistantInstall" },
  --   cmd = { "DistantLaunch", "DistantRun" },
  --   config = function()
  --     require("distant").setup {
  --       ["*"] = vim.tbl_extend(
  --         "force",
  --         require("distant.settings").chip_default(),
  --         { mode = "ssh" } -- use SSH mode by default
  --       ),
  --     }
  --   end,
  -- },
  -- {
  --   "nathom/filetype.nvim",
  --   config = function()
  --     require("user.filetype").config()
  --   end,
  -- },
  -- {
  --   "Nguyen-Hoang-Nam/nvim-mini-file-icons",
  --   config = function()
  --     require("user.dev_icons").set_icon()
  --   end,
  --   -- disable = lvim.builtin.nvim_web_devicons == nil,
  -- },
  -- {
  --   "nvim-telescope/telescope-live-grep-raw.nvim",
  -- },
  -- { "mtdl9/vim-log-highlighting", ft = { "text", "log" } },
  -- {
  --   "yamatsum/nvim-cursorline",
  --   opt = true,
  --   event = "BufWinEnter",
  -- },
  -- {
  --   "abecodes/tabout.nvim",
  --   wants = { "nvim-treesitter" },
  --   after = { "nvim-cmp" },
  --   config = function()
  --     require("user.tabout").config()
  --   end,
  -- },
  -- {
  --   "kevinhwang91/nvim-hlslens",
  --   config = function()
  --     require("user.hlslens").config()
  --   end,
  --   event = "BufReadPost",
  -- },
  -- {
  --   "kosayoda/nvim-lightbulb",
  --   config = function()
  --     vim.fn.sign_define(
  --       "LightBulbSign",
  --       { text = require("user.lsp_kind").icons.code_action, texthl = "DiagnosticInfo" }
  --     )
  --   end,
  --   event = "BufRead",
  --   ft = { "rust", "go", "typescript", "typescriptreact" },
  -- },
  -- {
  --   "chrisbra/csv.vim",
  --   ft = { "csv" },
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   after = "nvim-treesitter",
  -- },
  -- {
  --   "sidebar-nvim/sidebar.nvim",
  --   config = function()
  --     require("user.sidebar").config()
  --   end,
  --   -- event = "BufRead",
  -- },
  -- {
  --   "skywind3000/asynctasks.vim",
  --   requires = {
  --     { "skywind3000/asyncrun.vim" },
  --   },
  --   setup = function()
  --     vim.cmd [[
  --       let g:asyncrun_open = 8
  --       let g:asynctask_template = '~/.config/nvim/templates/task_template.ini'
  --       let g:asynctasks_extra_config = ['~/.config/nvim/templates/tasks.ini']
  --     ]]
  --   end,
  --   event = "BufRead",
  -- },
  -- {
  --   "scalameta/nvim-metals",
  --   requires = { "nvim-lua/plenary.nvim" },
  -- },
  -- {
  --   "jbyuki/instant.nvim",
  --   event = "BufRead",
  -- },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  -- },
  -- {
  --   "j-hui/fidget.nvim",
  --   config = function()
  --     require("user.fidget_spinner").config()
  --   end,
  -- },
  -- {
  --   "michaelb/sniprun",
  --   run = "bash ./install.sh",
  -- },
  -- {
  --   "liuchengxu/vista.vim",
  --   setup = function()
  --     require("user.plugins.vista").config()
  --   end,
  --   event = "BufReadPost",
  --   -- disable = lvim.builtin.tag_provider ~= "vista",
  -- },
  -- {
  --   "p00f/clangd_extensions.nvim",
  --   config = function()
  --     require("user.cle").config()
  --   end,
  --   ft = { "c", "cpp", "objc", "objcpp" },
  -- },
  -- {
  --   "editorconfig/editorconfig-vim",
  --   event = "BufRead",
  -- },
  -- {
  --   "saecki/crates.nvim",
  --   event = { "BufRead Cargo.toml" },
  --   requires = { { "nvim-lua/plenary.nvim" } },
  --   config = function()
  --     require("user.crates").config()
  --   end,
  -- },
  -- {
  --   "gfeiyou/command-center.nvim",
  --   config = function()
  --     require("user.cc").config()
  --   end,
  --   requires = "nvim-telescope/telescope.nvim",
  -- },

  -- {
  --   "stevearc/dressing.nvim",
  --   config = function()
  --     require("user.plugins.dress").config()
  --   end,
  --   event = "BufWinEnter",
  -- },
  {
    "ThePrimeagen/refactoring.nvim",
    ft = { "typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "php" },
    event = "BufRead",
    config = function()
      require("refactoring").setup {}
    end,
  },
}

return {
	{
		"habamax/vim-habamax",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme habamax")
		end,
	},

	{ -- Fuzzy Finder (files, lsp, etc)
	    'nvim-telescope/telescope.nvim',
	    event = 'VimEnter',
	    branch = '0.1.x',
	    dependencies = {
	      'nvim-lua/plenary.nvim',
	      { -- If encountering errors, see telescope-fzf-native README for installation instructions
	        'nvim-telescope/telescope-fzf-native.nvim',
	
	        -- `build` is used to run some command when the plugin is installed/updated.
	        -- This is only run then, not every time Neovim starts up.
	        build = 'make',
	
	        -- `cond` is a condition used to determine whether this plugin should be
	        -- installed and loaded.
	        cond = function()
	          return vim.fn.executable 'make' == 1
	        end,
	      },
	      { 'nvim-telescope/telescope-ui-select.nvim' },
	
	      -- Useful for getting pretty icons, but requires a Nerd Font.
	      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
	    },
	    config = function()
	      require('telescope').setup {
	        -- You can put your default mappings / updates / etc. in here
	        --  All the info you're looking for is in `:help telescope.setup()`
	        --
	        -- defaults = {
	        --   mappings = {
	        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
	        --   },
	        -- },
	        -- pickers = {}
	        extensions = {
	          ['ui-select'] = {
	            require('telescope.themes').get_dropdown(),
	          },
	        },
	      }
	
	      -- Enable Telescope extensions if they are installed
	      pcall(require('telescope').load_extension, 'fzf')
	      pcall(require('telescope').load_extension, 'ui-select')
	
	      -- See `:help telescope.builtin`
	      local builtin = require 'telescope.builtin'
	      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
	      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
	      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
	      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
	      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
	      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
	      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
	      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
	      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
	      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
		  --
	      -- Slightly advanced example of overriding default behavior and theme
	      vim.keymap.set('n', '<leader>/', function()
	        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
	        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	          winblend = 10,
	          previewer = false,
	        })
	      end, { desc = '[/] Fuzzily search in current buffer' })
	
	      -- It's also possible to pass additional configuration options.
	      --  See `:help telescope.builtin.live_grep()` for information about particular keys
	      vim.keymap.set('n', '<leader>s/', function()
	        builtin.live_grep {
	          grep_open_files = true,
	          prompt_title = 'Live Grep in Open Files',
	        }
	      end, { desc = '[S]earch [/] in Open Files' })
	
	      -- Shortcut for searching your Neovim configuration files
	      vim.keymap.set('n', '<leader>sn', function()
	        builtin.find_files { cwd = vim.fn.stdpath 'config' }
	      end, { desc = '[S]earch [N]eovim files' })
	    end,
	  },	

    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
	-- { 'neovim/nvim-lspconfig',
	-- 	config = function()
 --    	 	vim.api.nvim_create_autocmd('LspAttach', {
 --    	 	   group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
 --    	 	   callback = function(event)
 --    	 	     local map = function(keys, func, desc, mode)
 --    	 	       mode = mode or 'n'
 --    	 	       vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
 --    	 	     end
 --    	 	     map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
 --    	 	     map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
 --    	 	     map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
 --    	 	     map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
 --    	 	     map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
 --    	 	     map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
 --    	 	     map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
 --    	 	     map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
 --    	 	     map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	-- 			end
	-- 		})
	-- 	end,
	-- },

	'folke/neodev.nvim',

	{
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'rafamadriz/friendly-snippets',
            
            'hrsh7th/cmp-nvim-lsp',
            
        },
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
    },


  -- After important plugins are loaded in, load the rest.
	require "pluginlist"
}

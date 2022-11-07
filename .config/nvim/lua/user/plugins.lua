local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "/usr/bin/git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Packer plugins here
    use "wbthomason/packer.nvim"          -- Have packer manage itself
    use "nvim-lua/popup.nvim"             -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim"           -- Useful lua functions used by lots of plugins
    use "windwp/nvim-autopairs"           -- Autopairs, integrates with both cmp and treesitter
    use "kyazdani42/nvim-web-devicons"    -- Needed by NVim Tree and other plugins

    -- Colorscheme
    use 'tomasiser/vim-code-dark'
    use 'EdenEast/nightfox.nvim'

    -- Completion and snippets
    use 'L3MON4D3/LuaSnip'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-calc',
            'saadparwaiz1/cmp_luasnip',
        }
    }
    use "rafamadriz/friendly-snippets"

    -- LSP
    use "neovim/nvim-lspconfig"           -- Enable LSP

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            'nvim-lua/plenary.nvim'
        },
    }

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }

    -- Toggleterm
    use "akinsho/toggleterm.nvim"

    -- NVim Tree
    use "kyazdani42/nvim-tree.lua"

    -- Status line
    use "feline-nvim/feline.nvim"

    -- Git
    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)


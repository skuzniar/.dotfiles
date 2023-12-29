-- Install lazy nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Colorscheme
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme nightfox]])
        end,
    },
    -- Status line
    {
        "feline-nvim/feline.nvim",
    },
    -- NVim Tree
    {
        "kyazdani42/nvim-tree.lua",
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "windwp/nvim-autopairs",
    },
    {
        "nvim-lua/popup.nvim",
    },
    {
        "kyazdani42/nvim-web-devicons",
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-calc',
            'saadparwaiz1/cmp_luasnip',
        },
    },
    {
        "L3MON4D3/LuaSnip",
    },
    {
        "rafamadriz/friendly-snippets",
    },
    -- Git
    {
        "NeogitOrg/neogit",
    },
    {
        "lewis6991/gitsigns.nvim",
    },
    -- Diff
    {
        "sindrets/diffview.nvim",
    },
    -- Toggleterm
    {
        "akinsho/toggleterm.nvim",
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        --run = ":TSUpdate",
    },
    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        --tag = '0.1.2',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- C++ Gen
    {
        dir = "/Users/slawomir/dvlp/nvim-cppgen",
        dependencies = {
            "neovim/nvim-lspconfig"
        },
    }
})


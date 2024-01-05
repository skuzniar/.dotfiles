return
{
    dir = "/Users/slawomir/dvlp/nvim-cppgen",
    dependencies = {
        "neovim/nvim-lspconfig"
    },
    opts = 
    {
        log = {
            plugin      = 'nvim-cppgen',
            level       = 'debug',
            use_console = false
        },
        oss = {
            drop_prefix     = true,
            camelize        = true,
            equal_sign      = ': ',
            field_separator = ' '
        }
    },
}

require("nvim-cppgen").setup {
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
}

return
{
    --"skuzniar/nvim-cppgen",
    dir = "/Users/slawomir/dvlp/cppgen.nvim",
    opts =
    {
        log = {
            plugin      = 'cppgen',
            level       = 'trace',
            use_console = false
        },

        keepindent = true,

        -- Generator of Class type shift operator
        class = {
            separator = "' '",
            preamble  = function(classname)
                return '[' .. classname .. ']='
            end,
            label = function(classname, fieldname, camelized)
                return camelized .. ': '
            end,
            value = function(fieldref, type)
                return fieldref
            end
        },

        -- Generator of Enum type shift operator
        enum = {
            value = function(mnemonic, value)
                if (value) then
                    return '"' .. value .. '(' .. mnemonic .. ')' .. '"'
                else
                    return '"' .. mnemonic .. '"'
                end
            end
        },

        -- JSON serialization using cereal library
        cereal = {
            class = {
                label = function(classname, fieldname, camelized)
                    -- demonstrate field skipping
                    if camelized == 'SkipMe' then
                        return nil
                    end
                    return camelized
                end,
                value = function(fieldref, type)
                    if type and type == "char" then
                        return 'tv(' .. fieldref .. ')'
                    end
                    return fieldref
                end,
                xnullcheck = function(fieldref, type)
                    return 'isnull(' .. fieldref .. ')'
                end,
                xnullvalue = function(fieldref, type)
                    return 'nullptr'
                end
            },
        },

        -- Switch statement generator
        switch = {
            keepindent = false,
            enum = {
                value = function(classname, fieldname)
                    return '// ' .. classname .. '::' .. fieldname
                end
            },
        }
    }
}

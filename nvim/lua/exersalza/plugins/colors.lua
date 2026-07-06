local ts_groups = {
    [ '@variable' ] = 'TSVariable',
    [ '@keyword' ] = 'TSKeyword',
    [ '@function' ] = 'TSFunction',
    [ '@function.method' ] = 'TSMethod',
    [ '@string' ] = 'TSString',
    [ '@comment' ] = 'TSComment',
    [ '@constant' ] = 'TSConstant',
    [ '@number' ] = 'TSNumber',
    [ '@boolean' ] = 'TSBoolean',
    [ '@operator' ] = 'TSOperator',
    [ '@punctuation' ] = 'TSPunctBracket',
    [ '@property' ] = 'TSProperty',
    [ '@parameter' ] = 'TSParameter',
    [ '@type' ] = 'TSType',
}


return {
    {
        "tiagovla/tokyodark.nvim",
        opts = {
            -- custom options here
        },
        config = function(_, opts)
            require("tokyodark").setup(opts)
            vim.cmd [[colorscheme tokyodark]]

            for new, old in pairs(ts_groups) do
              vim.api.nvim_set_hl(0, new, { link = old })
            end
        end,
    },
}

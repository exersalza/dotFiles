return {
    "brenoprata10/nvim-highlight-colors",
    lazy = false,

    config = function()
        require("nvim-highlight-colors").setup({
            render = 'virtual', -- enables inline virtual text
            virtual_symbol = '■', -- choose your preferred symbol
            virtual_symbol_position = 'before', -- show color before the code
        })
    end,
}

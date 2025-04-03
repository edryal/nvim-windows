return {
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
        spec = {
            { '<leader>e', group = '[E]xplorer' },
            { '<leader>c', group = '[C]ode' },
            { '<leader>d', group = '[D]ebug' },
            { '<leader>s', group = '[S]earch' },
            { '<leader>g', group = '[G]it' },
            { '<leader>f', group = '[F]ind' },
            { '<leader>J', group = '[J]ava' },
            { '<leader>w', group = '[W]indow' },
            { '<leader>C', group = '[C]ompiler' },
            { '<leader>t', group = '[T]est' },
            { '<leader>n', group = '[N]oice' },
            { '<leader>p', group = '[P]review' },
        },
    }
}

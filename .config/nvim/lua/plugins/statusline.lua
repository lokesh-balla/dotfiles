return {
    -- statusline
    {
        'echasnovski/mini.statusline',
        version = '*',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        config = function()
            local statusline = require('mini.statusline')
            statusline.setup()

            -- display column count and percent
            statusline.section_location = function(args)
                if statusline.is_truncated(args.trunc_width) then return '%2v│%3p%%' end

                return '%2v:%-2{virtcol("$") - 1}│%3p%%'
            end
            -- disabling search count
            statusline.section_searchcount = function() return '' end
        end,
    },
}

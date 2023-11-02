-- plugins/telescope.lua:
return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.2',
    -- or branch = '0.1.x',
    config = function()
        require('telescope').setup({
            defaults = {
                mappings = {
					-- 2023/09/01 now not working 
					-- jk is called under attach_mappings script and I redo the situation [jk]to [jj]
                    i = {
                        ["jk"] = require("telescope.actions").close,
                    },
                },
				-- temporary settings because telescope.actions.close is now working
				-- under the issue code replace telescope.actions.close
				-- https://github.com/nvim-telescope/telescope.nvim/issues/2540
                attach_mappings = function(prompt_bufnr, map)
                    map('i', '<CR>', function()
                        local selection = require("telescope.actions.state").get_selected_entry()
                        require("telescope.actions").close(prompt_bufnr)
                        vim.schedule(function()
                            vim.api.nvim_put({selection.value}, "l", true, true)
                        end)
                    end)
                    return true
                end,
            }
        })
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
}


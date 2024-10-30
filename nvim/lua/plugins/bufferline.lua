return{
    "akinsho/bufferline.nvim",
    config = function()
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        require('bufferline').setup({
            options = {
                mode = "buffers", -- set to "tabs" to only show tabpages instead
                close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
                right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
                left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
                middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
                buffer_close_icon = '󰅖',
                modified_icon = '● ',
                close_icon = ' ',
                left_trunc_marker = ' ',
                right_trunc_marker = ' ',
                indicator = {
                    style = 'none',
                },
                name_formatter = function(buf)  -- buf contains:
                    -- name                | str        | the basename of the active file
                    -- path                | str        | the full path of the active file
                    -- bufnr               | int        | the number of the active buffer
                    -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
                    -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
                end,
                max_name_length = 15,
                max_prefix_length = 15,
                truncate_names = true,
                tab_size = 15,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false, -- only applies to coc
                diagnostics_update_on_event = true, -- use nvim's diagnostic handler
                -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    return "("..count..")"
                end,
                custom_filter = function(buf_number, buf_numbers)
                    if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                        return true
                    end
                    if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                        return true
                    end
                    if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                        return true
                    end
                    if buf_numbers[1] ~= buf_number then
                        return true
                    end
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "left",
                        separator = false,
                    }
                },
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                show_tab_indicators = false,
                show_duplicate_prefix = false,
                separator_style = { '|', '|' },
                enforce_regular_tabs = true,
                always_show_bufferline = true,
                auto_toggle_bufferline = true,
                hover = {
                    enabled = false,
                    delay = 200,
                    reveal = {'close'}
                },
                sort_by = function(buffer_a, buffer_b)
                    -- add custom logic
                    local modified_a = vim.fn.getftime(buffer_a.path)
                    local modified_b = vim.fn.getftime(buffer_b.path)
                    return modified_a > modified_b
                end,
                pick = {
                    alphabet = "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890",
                },
            },
            highlights = {
                fill = {
                    fg = '',
                    bg = 'none',
                },
                background = {
                    fg = '#928374',
                    bg = 'none',
                },
                separator = {
                    fg = 'none',
                    bg = 'none',
                },
                close_button = {
                    fg = '#ebdbb2',
                    bg = 'none',
                },
                close_button_visible = {
                    fg = '#ebdbb2',
                    bg = 'none',
                },
                close_button_selected = {
                    fg = 'none',
                    bg = 'none',
                },
                buffer_visible = {
                    fg = '#928374',
                    bg = 'none',
                },
                buffer_selected = {
                    fg = 'none',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                diagnostic = {
                    fg = 'none',
                    bg = 'none',
                },
                diagnostic_visible = {
                    fg = 'none',
                    bg = 'none',
                },
                diagnostic_selected = {
                    fg = 'none',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                indicator_visible = {
                    fg = 'none',
                    bg = 'none',
                },
                indicator_selected = {
                    fg = 'none',
                    sp = '#ebdbb2',
                    bg = 'none',
                },
                warning = {
                    fg = 'none',
                    bg = 'none',
                },
                warning_visible = {
                    fg = 'none',
                    bg = 'none',
                },
                warning_selected = {
                    fg = 'none',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                warning_diagnostic = {
                    fg = 'none',
                    bg = 'none',
                },
                warning_diagnostic_visible = {
                    fg = 'none',
                    bg = 'none',
                },
                warning_diagnostic_selected = {
                    fg = 'none',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                error = {
                    fg = 'none',
                    bg = 'none',
                },
                error_visible = {
                    fg = 'none',
                    bg = 'none',
                },
                error_selected = {
                    fg = 'none',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                error_diagnostic = {
                    fg = 'none',
                    bg = 'none',
                },
                error_diagnostic_visible = {
                    fg = 'none',
                    bg = 'none',
                },
                error_diagnostic_selected = {
                    fg = 'none',
                    bg = 'none',
                    bold = true,
                    italic = true,
                },
                modified = {
                    fg = '#ebdbb2',
                    bg = 'none',
                },
                modified_visible = {
                    fg = '#ebdbb2',
                    bg = 'none',
                },
                modified_selected = {
                    fg = '#ebdbb2',
                    bg = 'none',
                },
                trunc_marker = {
                    fg = 'none',
                    bg = 'none',
                }
            } 
        })
    end
   

}

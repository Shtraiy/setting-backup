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
                max_name_length = 18,
                max_prefix_length = 18,
                truncate_names = true,
                tab_size = 18,
                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false, -- only applies to coc
                diagnostics_update_on_event = true, -- use nvim's diagnostic handler
                -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    return "("..count..")"
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
                separator_style = { '│', '│' },
                enforce_regular_tabs = true,
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
                tab = {
                    fg = '#928374',
                    bg = 'none',
                },
                tab_selected = {
                    fg = '#ebdbb2',
                    bg = 'none',
                },
                tab_separator = {
                    fg = '#ebdbb2',
                    bg = 'none',
                },
                tab_separator_selected = {
                    fg = '#ebdbb2',
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
                    fg = '#928374',
                    bg = 'none',
                },
                diagnostic_visible = {
                    fg = '#928374',
                    bg = 'none',
                },
                diagnostic_selected = {
                    fg = '#fabd2f',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                hint = {
                    fg = '#928374',
                    bg = 'none',
                },
                hint_visible = {
                    fg = '#928374',
                    bg = 'none',
                },
                hint_selected = {
                    fg = '#ebdbb2',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                hint_diagnostic = {
                    fg = '#b8bb26',
                    bg = 'none',
                },
                hint_diagnostic_visible = {
                    fg = '#b8bb26',
                    bg = 'none',
                },
                hint_diagnostic_selected = {
                    fg = '#b8bb26',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                info = {
                    fg = '#928374',
                    bg = 'none',
                },
                info_visible = {
                    fg = '#928374',
                    bg = 'none',
                },
                info_selected = {
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                info_diagnostic = {
                    fg = '#928374',
                    bg = 'none',
                },
                info_diagnostic_visible = {
                    fg = '#928374',
                    bg = 'none',
                },
                info_diagnostic_selected = {
                    fg = '#fabd2f',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                indicator_visible = {
                    fg = '#928374',
                    bg = 'none',
                },
                indicator_selected = {
                    fg = '#ebdbb2',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                warning = {
                    bg = 'none',
                },
                warning_visible = {
                    bg = 'none',
                },
                warning_selected = {
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                warning_diagnostic = {
                    fg = '#fe8019',
                    bg = 'none',
                },
                warning_diagnostic_visible = {
                    fg = '#fe8019',
                    bg = 'none',
                },
                warning_diagnostic_selected = {
                    fg = '#fe8019',
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                error = {
                    bg = 'none',
                },
                error_visible = {
                    bg = 'none',
                },
                error_selected = {
                    bg = 'none',
                    bold = true,
                    italic = false,
                },
                error_diagnostic = {
                    fg = '#fb4934',
                    bg = 'none',
                },
                error_diagnostic_visible = {
                    fg = '#fb4934',
                    bg = 'none',
                },
                error_diagnostic_selected = {
                    fg = '#fb4934',
                    bg = 'none',
                    bold = true,
                    italic = true,
                },
                modified = {
                    fg = '#8ec07c',
                    bg = 'none',
                },
                modified_visible = {
                    fg = '#8ec07c',
                    bg = 'none',
                },
                modified_selected = {
                    fg = '#8ec07c',
                    bg = 'none',
                },
                trunc_marker = {
                    bg = 'none',
                }
            } 
        })
    end

}

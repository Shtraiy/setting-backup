return{
    "zbirenbaum/copilot-cmp",
    config = function ()
        require("copilot_cmp").setup({
            event = { "InsertEnter", "LspAttach" },
            fix_pairs = true,
            suggestion = { enabled = false },
            panel = { enabled = false },
        })
    end
}

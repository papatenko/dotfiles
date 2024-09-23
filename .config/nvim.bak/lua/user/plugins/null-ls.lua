return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require "null-ls"

    null_ls.setup {
      -- other null-ls options
      client = {
        -- other client options
        offset_encoding = "utf-16",
      },
    }

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    -- config.sources {
    -- Set a formatter
    -- null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.formatting.prettier,
    -- }
    return config -- return final config table
  end,
}

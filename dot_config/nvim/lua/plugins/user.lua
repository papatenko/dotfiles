local cmp = require "cmp"

---@type LazySpec
return {

  -- AI Tools
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "pass show api/openai",
      }
    end,
  },

  --Override Plugins
  {
    -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    opts = {
      mapping = {
        ["<CR>"] = cmp.mapping.confirm { select = true },
      },
    },
  },
  {
    "mbbill/undotree",
    config = function() vim.g.undotree_WindowLayout = 3 end,
  },
}

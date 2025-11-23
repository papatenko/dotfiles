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
  {
    "Exafunction/windsurf.vim",
    config = function()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, { expr = true, silent = true })
      vim.keymap.set(
        "i",
        "<c-;>",
        function() return vim.fn["codeium#CycleCompletions"](1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set(
        "i",
        "<c-,>",
        function() return vim.fn["codeium#CycleCompletions"](-1) end,
        { expr = true, silent = true }
      )
      vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true, silent = true })
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

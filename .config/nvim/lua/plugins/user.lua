local cmp = require "cmp"
local lspkind = require "lspkind"

local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
}

---@type LazySpec
return {

  -- AI Tools
  {
    "tzachar/cmp-tabnine",
    event = "BufEnter",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    config = function()
      local tabnine = require "cmp_tabnine.config"
      tabnine:setup {
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
        run_on_every_keystroke = true,
        snippet_placeholder = "..",
        ignored_file_types = {
          -- default is not to ignore
          -- uncomment to ignore in lua:
          -- lua = true
        },
        show_prediction_strength = false,
      }
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
    },
    config = function()
      require("chatgpt").setup {
        api_key_cmd = "pass show api/openai",
      }
    end,
  },

  -- Override Plugins
  {
    -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "luasnip", priority = 1000 },
        { name = "buffer", priority = 800 },
        { name = "nvim_lsp", priority = 600 },
        { name = "cmp_tabnine", priority = 400 },
        { name = "path", priority = 200 },
      },
      dependences = {
        "tzachar/cmp-tabnine",
        build = "./install.sh",
        config = function()
          local tabnine = require "cmp_tabnine.config"
          tabnine:setup {} -- put your options here
        end,
      },
      formatting = {
        format = function(entry, vim_item)
          -- if you have lspkind installed, you can use it like
          -- in the following line:
          vim_item.kind = lspkind.symbolic(vim_item.kind, { mode = "symbol" })
          vim_item.menu = source_mapping[entry.source.name]
          if entry.source.name == "cmp_tabnine" then
            local detail = (entry.completion_item.labelDetails or {}).detail
            vim_item.kind = ""
            if detail and detail:find ".*%%.*" then vim_item.kind = vim_item.kind .. " " .. detail end

            if (entry.completion_item.data or {}).multiline then vim_item.kind = vim_item.kind .. " " .. "[ML]" end
          end
          local maxwidth = 80
          vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
          return vim_item
        end,
      },
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

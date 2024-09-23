-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "yes", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
        swapfile = false,
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- Change directory --
        ["<leader>cd"] = { ":cd %:h", desc = "Changes nvim dir relative to dir of file" },

        -- Horizontal Split Replacement --
        ["Z"] = { "<cmd>sp<cr>", desc = "Horizontal Split" },
        ["\\"] = false,

        -- AI --
        ["<leader>a"] = { name = "󱚤 AI" },
        ["<leader>ac"] = { "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
        ["<leader>ae"] = { "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
        ["<leader>ag"] = { "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
        ["<leader>at"] = { "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
        ["<leader>ak"] = { "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
        ["<leader>ad"] = { "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
        ["<leader>aa"] = { "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
        ["<leader>ao"] = { "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
        ["<leader>as"] = { "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
        ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
        ["<leader>ax"] = { "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
        ["<leader>ar"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
        ["<leader>al"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
      },
      v = {
        -- AI --
        ["<leader>a"] = { name = "󱚤 AI" },
        ["<leader>ac"] = { "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
        ["<leader>ae"] = { "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction" },
        ["<leader>ag"] = { "<cmd>ChatGPTRun grammar_correction<CR>", desc = "Grammar Correction" },
        ["<leader>at"] = { "<cmd>ChatGPTRun translate<CR>", desc = "Translate" },
        ["<leader>ak"] = { "<cmd>ChatGPTRun keywords<CR>", desc = "Keywords" },
        ["<leader>ad"] = { "<cmd>ChatGPTRun docstring<CR>", desc = "Docstring" },
        ["<leader>aa"] = { "<cmd>ChatGPTRun add_tests<CR>", desc = "Add Tests" },
        ["<leader>ao"] = { "<cmd>ChatGPTRun optimize_code<CR>", desc = "Optimize Code" },
        ["<leader>as"] = { "<cmd>ChatGPTRun summarize<CR>", desc = "Summarize" },
        ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<CR>", desc = "Fix Bugs" },
        ["<leader>ax"] = { "<cmd>ChatGPTRun explain_code<CR>", desc = "Explain Code" },
        ["<leader>ar"] = { "<cmd>ChatGPTRun roxygen_edit<CR>", desc = "Roxygen Edit" },
        ["<leader>al"] = { "<cmd>ChatGPTRun code_readability_analysis<CR>", desc = "Code Readability Analysis" },
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
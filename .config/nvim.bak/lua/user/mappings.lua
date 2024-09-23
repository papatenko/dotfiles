-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    ["<leader>b"] = { name = "Buffers" },
    -- Venv --
    ["<leader>v"] = { name = " Venv" },
    ["<leader>vs"] = { "<cmd>VenvSelect<cr>" },
    ["<leader>vc"] = { "<cmd>VenvSelectCached<cr>" },
    -- Gen --
    -- Change directory --
    ["<leader>cd"] = { ":cd %:h<cr>", desc = "Changes nvim dir relative to dir of file" },
    ["<leader>ch"] = { "<cmd>cd ~<cr>" },
    -- Horizontal Split Replacement --
    ["Z"] = { "<cmd>sp<cr>", desc = "Horizontal Split" },
    ["\\"] = false,
    -- Replace Word --
    ["<leader>r"] = { "<Plug>CtrlSFCwordPath", desc = "Refactor" },
    -- Undo Tree --
    ["<leader>s"] = { "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    ["<leader>k"] = { "<cmd>UndotreeFocus<cr>", desc = "Undotree" },

    -- AI --
    ["<leader>a"] = {
      name = "󱚤 AI",
      c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
      e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
      g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
      t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
      k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
      d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
      a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
      o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
      s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
      f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
      x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
      r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit", mode = { "n", "v" } },
      l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
    },
  },
  v = {},
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-h>"] = false,
    ["<C-j>"] = false,
    ["<C-k>"] = false,
    ["<C-l>"] = false,
  },
}

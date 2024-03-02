-- For Harpoon Keybinds

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
    -- ChatGPT --
    ["<leader>a"] = { name = "󱚤 ChatGPT" },
    ["<leader>aa"] = { "<cmd>ChatGPT<cr>" },
    ["<leader>ac"] = { "<cmd>ChatGPTCompleteCode<cr>" },
    ["<leader>ae"] = { "<cmd>ChatGPTRun explain_code<cr>" },
    ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<cr>" },
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
  },
  v = {
    -- ChatGPT --
    ["<leader>a"] = { name = "󱚤 ChatGPT" },
    ["<leader>ac"] = { "<cmd>ChatGPTCompleteCode<cr>" },
    ["<leader>aa"] = { "<cmd>ChatGPT<cr>" },
    ["<leader>ae"] = { "<cmd>ChatGPTRun explain_code<cr>" },
    ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<cr>" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    ["<C-h>"] = false,
    ["<C-j>"] = false,
    ["<C-k>"] = false,
    ["<C-l>"] = false,
  },
}

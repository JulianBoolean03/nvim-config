require "nvchad.mappings"

-- Add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Define a function to toggle terminal in horizontal split
local terminal_bufnr = nil

function ToggleTerminal()
  if terminal_bufnr and vim.api.nvim_buf_is_valid(terminal_bufnr) then
    -- Close the terminal if it's already open
    vim.api.nvim_buf_delete(terminal_bufnr, { force = true })
    terminal_bufnr = nil
  else
    -- Open a new terminal in a horizontal split
    vim.cmd("split")
    vim.cmd("terminal")
    terminal_bufnr = vim.api.nvim_get_current_buf()
  end
end

-- Map Ctrl-a to toggle the terminal
map("n", "<C-a>", ToggleTerminal, { desc = "Toggle terminal in horizontal split" })


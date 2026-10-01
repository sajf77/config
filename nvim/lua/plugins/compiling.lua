return {
  {
    "ej-shafran/compile-mode.nvim",
    version = false, -- or remove this line entirely
    keys = {
      { "<C-a>", "<cmd>Compile<CR>", desc = "Compile/Run current file" },
      { "]e", "<cmd>NextError<CR>", desc = "Next compile error" },
      { "[e", "<cmd>PrevError<CR>", desc = "Previous compile error" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },

    config = function()
      vim.g.compile_mode = {
        bang_expansion = true,
        default_command = {
          python = "python3 %",
          c = "gcc -Wall % -o %:r && ./%:r",
          cpp = "g++ -std=c++17 -Wall % -o %:r && ./%:r",
          matlab = "octave %",
          julia = "julia %",
          sage = "sage %",
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "compilation",
        callback = function()
          vim.cmd("wincmd L")
          vim.cmd("vertical resize " .. math.floor(vim.o.columns * 0.55))
        end,
      })

      vim.keymap.set("n", "<C-x>", function()
        local win = vim.fn.bufwinid("*compilation*")
        if win ~= -1 then
          vim.api.nvim_win_close(win, true)
        end
      end, { desc = "Close compilation window" })
    end,
  },
}

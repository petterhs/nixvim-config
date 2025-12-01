{
  autoGroups = {
    nixvim_highlight_yank = { };
    nixvim_resize_splits = { };
    nixvim_last_loc = { };
    nixvim_close_with_q = { };
    nixvim_man_unlisted = { };
    nixvim_auto_create_dir = { };
    nixvim_nvimtree_quit = { };
  };
  autoCmd = [
    {
      desc = "Highlight on yank";
      event = [ "TextYankPost" ];
      group = "nixvim_highlight_yank";
      callback = {
        __raw = ''
          function()
            vim.highlight.on_yank()
          end
        '';
      };
    }
    {
      desc = "Resize splits if window got resized";
      event = [ "VimResized" ];
      group = "nixvim_resize_splits";
      callback = {
        __raw = ''
          function(event)
            local current_tab = vim.fn.tabpagenr()
            vim.cmd("tabdo wincmd =")
            vim.cmd("tabnext " .. current_tab)
          end
        '';
      };
    }
    {
      desc = "Go to last loc when opening a buffer";
      event = [ "BufReadPost" ];
      group = "nixvim_last_loc";
      callback = {
        __raw = ''
          function(event)
            local exclude = { "gitcommit" }
            local buf = event.buf
            if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
              return
            end
            vim.b[buf].lazyvim_last_loc = true
            local mark = vim.api.nvim_buf_get_mark(buf, '"')
            local lcount = vim.api.nvim_buf_line_count(buf)
            if mark[1] > 0 and mark[1] <= lcount then
              pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
          end
        '';
      };
    }
    {
      desc = "Close these type of File with <q>";
      event = [ "FileType" ];
      group = "nixvim_close_with_q";
      pattern = [
        "PlenaryTestPopup"
        "help"
        "lspinfo"
        "notify"
        "qf"
        "query"
        "spectre_panel"
        "startuptime"
        "tsplayground"
        "neotest-output"
        "checkhealth"
        "neotest-summary"
        "neotest-output-panel"
      ];

      callback = {
        __raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
            vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
          end
        '';
      };
    }
    {
      desc = "Make it easier to close man-files when opened inline";
      event = [ "FileType" ];
      group = "nixvim_man_unlisted";
      pattern = [ "man" ];
      callback = {
        __raw = ''
          function(event)
            vim.bo[event.buf].buflisted = false
          end
        '';
      };
    }
    {
      desc = "Auto create dir when save file, in case some intermediate directory is missing";
      event = [ "BufWritePre" ];
      group = "nixvim_auto_create_dir";
      callback = {
        __raw = ''
          function(event)
            if event.match:match("^%w%w+://") then
              return
            end
            local file = vim.loop.fs_realpath(event.match) or event.match
            vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
          end
        '';
      };
    }
    {
      desc = "Close NvimTree when it is the last non-floating window";
      event = [ "QuitPre" ];
      group = "nixvim_nvimtree_quit";
      callback = {
        __raw = ''
          function()
            local tree_wins = {}
            local floating_wins = {}
            local wins = vim.api.nvim_list_wins()

            for _, w in ipairs(wins) do
              local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
              if bufname:match("NvimTree_") ~= nil then
                table.insert(tree_wins, w)
              end
              if vim.api.nvim_win_get_config(w).relative ~= "" then
                table.insert(floating_wins, w)
              end
            end
            if 1 == #wins - #floating_wins - #tree_wins then
              for _, w in ipairs(tree_wins) do
                vim.api.nvim_win_close(w, true)
              end
            end
          end
        '';
      };
    }
  ];
}

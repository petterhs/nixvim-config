{ ... }:
{
  plugins.snacks = {
    enable = true;
    settings = {
      bigfile.enabled = true;
      explorer.enabled = true;
      indent.enabled = true;
      input.enabled = true;
      notifier.enabled = true;
      picker = {
        enabled = true;
        sources = {
          explorer = {
            auto_close = true;
            layout = {
              layout = {
                position = "right";
              };
            };
          };
        };
      };
      quickfile.enabled = true;
      scroll.enabled = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action.__raw = ''
        function()
          local ok, snacks = pcall(require, 'snacks')
          if ok and snacks and snacks.picker then
            snacks.picker('files')
          else
            -- Fallback: try direct module access
            local picker = require('snacks.picker')
            if picker and picker.files then
              picker.files()
            end
          end
        end
      '';
      options = {
        silent = true;
        desc = "Find files (snacks)";
      };
    }
    {
      mode = "n";
      key = "<leader>fw";
      action.__raw = ''
        function()
          local ok, snacks = pcall(require, 'snacks')
          if ok and snacks and snacks.picker then
            snacks.picker('grep')
          else
            local picker = require('snacks.picker')
            if picker and picker.grep then
              picker.grep()
            end
          end
        end
      '';
      options = {
        silent = true;
        desc = "Live grep (snacks)";
      };
    }
    {
      mode = "n";
      key = "<leader>fb";
      action.__raw = ''
        function()
          local ok, snacks = pcall(require, 'snacks')
          if ok and snacks and snacks.picker then
            snacks.picker('buffers')
          else
            local picker = require('snacks.picker')
            if picker and picker.buffers then
              picker.buffers()
            end
          end
        end
      '';
      options = {
        silent = true;
        desc = "Buffers (snacks)";
      };
    }
    {
      mode = "n";
      key = "<leader>fd";
      action.__raw = ''
        function()
          local ok, snacks = pcall(require, 'snacks')
          if ok and snacks and snacks.picker then
            snacks.picker('diagnostics')
          else
            local picker = require('snacks.picker')
            if picker and picker.diagnostics then
              picker.diagnostics()
            end
          end
        end
      '';
      options = {
        silent = true;
        desc = "Diagnostics (snacks)";
      };
    }
    {
      mode = "n";
      key = "<leader>fs";
      action.__raw = ''
        function()
          local ok, snacks = pcall(require, 'snacks')
          if ok and snacks and snacks.picker then
            snacks.picker('lines')
          else
            local picker = require('snacks.picker')
            if picker and picker.lines then
              picker.lines()
            end
          end
        end
      '';
      options = {
        silent = true;
        desc = "Find string (snacks)";
      };
    }
    # Keymaps for snacks.explorer (replacing nvim-tree)
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = ''
        function()
          local ok, snacks = pcall(require, 'snacks')
          if ok and snacks and snacks.explorer then
            snacks.explorer()
          else
            local explorer = require('snacks.explorer')
            if explorer and explorer.toggle then
              explorer.toggle()
            elseif explorer and explorer.open then
              explorer.open()
            end
          end
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Explorer (snacks)";
      };
    }
    {
      mode = "n";
      key = "<C-n>";
      action.__raw = ''
        function()
          local ok, snacks = pcall(require, 'snacks')
          if ok and snacks and snacks.explorer then
            snacks.explorer()
          else
            local explorer = require('snacks.explorer')
            if explorer and explorer.toggle then
              explorer.toggle()
            elseif explorer and explorer.open then
              explorer.open()
            end
          end
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Explorer (snacks)";
      };
    }
  ];

  # Fix indent guides in preview windows
  extraConfigLua = ''
    -- Refresh indent guides when entering preview windows
    vim.api.nvim_create_autocmd({ 'BufWinEnter', 'WinEnter' }, {
      callback = function()
        local buftype = vim.bo.buftype
        -- Refresh indent guides for preview windows
        if buftype == 'nofile' or buftype == 'nowrite' then
          vim.defer_fn(function()
            if vim.b.snacks_indent then
              vim.b.snacks_indent = nil
              -- Force refresh
              vim.cmd('doautocmd BufWinEnter')
            end
          end, 50)
        end
      end,
    })
  '';
}

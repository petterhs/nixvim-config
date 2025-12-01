{
  plugins.obsidian = {
    enable = true;
    settings = {
      dir = "~/obsidian";
      completion = {
        nvim_cmp = true;
      };
      follow_url_func = {
        __raw = ''
          function(url)
            vim.fn.jobstart({"open", url})
          end
        '';
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "gf";
      action = "<cmd>ObsidianFollowLink<CR>";
      options = {
        silent = true;
        desc = "Follow Obsidian link";
      };
    }
    {
      mode = "n";
      key = "<leader>on";
      action = "<cmd>ObsidianNew<CR>";
      options = {
        silent = true;
        desc = "New Obsidian note";
      };
    }
    {
      mode = "n";
      key = "<leader>ot";
      action = "<cmd>ObsidianToday<CR>";
      options = {
        silent = true;
        desc = "Open today's note";
      };
    }
    {
      mode = "n";
      key = "<leader>os";
      action = "<cmd>ObsidianSearch<CR>";
      options = {
        silent = true;
        desc = "Search Obsidian notes";
      };
    }
    {
      mode = "n";
      key = "<leader>oq";
      action = "<cmd>ObsidianQuickSwitch<CR>";
      options = {
        silent = true;
        desc = "Quick switch note";
      };
    }
    {
      mode = "n";
      key = "<leader>ob";
      action = "<cmd>ObsidianBacklinks<CR>";
      options = {
        silent = true;
        desc = "Show backlinks";
      };
    }
    {
      mode = "n";
      key = "<leader>otm";
      action = "<cmd>ObsidianTemplate<CR>";
      options = {
        silent = true;
        desc = "Insert template";
      };
    }
    {
      mode = "n";
      key = "<leader>op";
      action = "<cmd>ObsidianPasteImg<CR>";
      options = {
        silent = true;
        desc = "Paste image from clipboard";
      };
    }
  ];
}

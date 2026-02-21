{
  plugins.obsidian = {
    enable = true;
    lazyLoad = {
      enable = true;
      settings = {
        cmd = [
          "Obsidian"
        ];
      };
    };
    settings = {
      dir = "~/obsidian";
      completion = {
        nvim_cmp = true;
      };
      legacy_commands = false;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "gf";
      action = "<cmd>Obsidian follow_link<CR>";
      options = {
        silent = true;
        desc = "Follow Obsidian link";
      };
    }
    {
      mode = "n";
      key = "<leader>on";
      action = "<cmd>Obsidian new<CR>";
      options = {
        silent = true;
        desc = "New Obsidian note";
      };
    }
    {
      mode = "n";
      key = "<leader>os";
      action = "<cmd>Obsidian search<CR>";
      options = {
        silent = true;
        desc = "Search Obsidian notes";
      };
    }
    {
      mode = "n";
      key = "<leader>oq";
      action = "<cmd>Obsidian quick_switch<CR>";
      options = {
        silent = true;
        desc = "Quick switch note";
      };
    }
    {
      mode = "n";
      key = "<leader>ob";
      action = "<cmd>Obsidian backlinks<CR>";
      options = {
        silent = true;
        desc = "Show backlinks";
      };
    }
    {
      mode = "n";
      key = "<leader>otm";
      action = "<cmd>Obsidian template<CR>";
      options = {
        silent = true;
        desc = "Insert template";
      };
    }
    {
      mode = "n";
      key = "<leader>op";
      action = "<cmd>Obsidian paste_img<CR>";
      options = {
        silent = true;
        desc = "Paste image from clipboard";
      };
    }
  ];
}

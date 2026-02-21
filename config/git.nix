{ ... }:
{
  plugins.gitsigns.enable = true;
  plugins.neogit = {
    enable = true;
    settings = {
      integrations = {
        diffview = true;
      };
    };
  };

  keymaps = [
    {
      key = "<leader>gs";
      action = "<cmd>Neogit<CR>";
      options.desc = "Git status";
    }
    {
      key = "<leader>gl";
      action = "<cmd>Telescope git_commits<CR>";
      options.desc = "Git log";
    }
    {
      key = "<leader>gb";
      action = "<cmd>Gitsigns toggle_current_line_blame<CR>";
      options.desc = "Git toggle line blame";
    }
    {
      key = "<leader>ghp";
      action = "<cmd>Gitsigns preview_hunk<CR>";
      options.silent = true;
      options.desc = "Git preview hunk";
    }
    {
      key = "<leader>ghr";
      action = "<cmd>Gitsigns reset_hunk<CR>";
      options.silent = true;
      options.desc = "Git reset hunk";
    }
    {
      key = "<leader>gha";
      action = "<cmd>Gitsigns stage_hunk<CR>";
      options.silent = true;
      options.desc = "Git add hunk";
    }
    {
      key = "]g";
      action = "<cmd>Gitsigns next_hunk<CR>";
      options.silent = true;
      options.desc = "Git next hunk";
    }
    {
      key = "[g";
      action = "<cmd>Gitsigns previous_hunk<CR>";
      options.silent = true;
      options.desc = "Git previous hunk";
    }
  ];
}

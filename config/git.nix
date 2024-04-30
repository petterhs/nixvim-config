{pkgs, ... }:
{
  plugins.gitsigns.enable = true;
  plugins.fugitive.enable = true;

  keymaps = [
    {
      key = "<leader>gs";
      action = "<cmd>Telescope git_status<CR>";
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
      key = "<leader>gpr";
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
      key = "<leader>gah";
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

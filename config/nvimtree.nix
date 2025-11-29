{ pkgs, ... }:
{
  plugins.nvim-tree = {
    enable = true;
    settings = {
      auto_close = true;
      hijack_cursor = true;
      respect_buf_cwd = true;
      updataded_focused_file = {
        enable = true;
        update_cwd = true;
      };
      view = {
        side = "right";
        signcolumn = "yes";
      };
      actions = {
        open_file.quit_on_open = true;
      };
      modified.enable = true;
      git = {
        enable = true;
        ignore = false;
        show_on_dirs = true;
        show_on_open_dirs = true;
      };
    };
  };

  keymaps = [
    {
      key = "<leader>e";
      action = "<cmd>NvimTreeToggle<CR>";
      options.silent = true;
      options.desc = "Toggle NvimTree";
    }
    {
      key = "<C-n>";
      action = "<cmd>NvimTreeToggle<CR>";
      options.silent = true;
      options.desc = "Toggle NvimTree";
    }
  ];
}

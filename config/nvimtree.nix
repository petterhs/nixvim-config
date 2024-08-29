{ pkgs, ... }:
{
  plugins.nvim-tree = {
    enable = true;
    autoClose = true;
    hijackCursor = true;
    actions = {
      openFile.quitOnOpen = true;
    };
    modified.enable = true;
    respectBufCwd = true;
    updateFocusedFile.enable = true;


    view = {
      side = "right";
      signcolumn = "yes";
    };

    git = {
      enable = true;
      ignore = false;
      showOnDirs = true;
      showOnOpenDirs = true;

    };
  };

  keymaps = [
    {
      key = "<leader>e";
      action = "<cmd>NvimTreeFocus<CR>";
      options.silent = true;
      options.desc = "Focus NvimTree";
    }
    {
      key = "<C-n>";
      action = "<cmd>NvimTreeToggle<CR>";
      options.silent = true;
      options.desc = "Toggle NvimTree";
    }
  ];
}

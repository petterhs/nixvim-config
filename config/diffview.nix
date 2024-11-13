{
  plugins.diffview = {
    enable = true;
  };
  keymaps = [
    {
      mode = [
        "n"
      ];
      key = "<leader>gd";
      action = "<cmd>DiffviewOpen<cr>";
      options = {
        desc = "Open Diffview";
      };
    }
  ];
}

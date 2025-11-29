{ ... }:
{
  plugins.hardtime.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "<leader>ht";
      action = "<cmd>Hardtime toggle<CR>";
      options = {
        silent = true;
        desc = "Toggle Hardtime";
      };
    }
  ];
}

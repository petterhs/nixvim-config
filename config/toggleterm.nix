{pkgs, ... }:
{
  plugins.toggleterm.enable = true;
  keymaps = [
    {
      key = "<A-i>";
      action = "<cmd>ToggleTerm direction=float<CR>";
      options.desc = "Toggle floating terminal";
    }
    {
      mode = "t";
      key = "<A-i>";
      action = "<cmd>ToggleTerm direction=float<CR>";
      options.desc = "Toggle floating terminal";
    }
  ];
}

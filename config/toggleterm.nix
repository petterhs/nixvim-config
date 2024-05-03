{pkgs, ... }:
{
  plugins.toggleterm = {
    enable = true;
    settings.float_opts = {
      height = 20;
      width = 60;
    };
  };
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

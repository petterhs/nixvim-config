{pkgs, ... }:
{
  plugins.telescope.enable = true;

  keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<CR>";
      options.silent = true;
      options.desc = "Find files";
    }
    {
      key = "<leader>fw";
      action = "<cmd>Telescope find_files<CR>";
      options.silent = true;
      options.desc = "Live grep";
    }
  ];
}

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
      action = "<cmd>Telescope live_grep<CR>";
      options.silent = true;
      options.desc = "Live grep";
    }
    {
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<CR>";
      options.silent = true;
      options.desc = "Buffers";
    }
    {
      key = "<leader>fd";
      action = "<cmd>Telescope diagnostics<CR>";
      options.silent = true;
      options.desc = "Diagnostics";
    }
    {
      key = "<leader>fs";
      action = "<cmd>Telescope grep_string<CR>";
      options.silent = true;
      options.desc = "Find string";
    }
  ];
}

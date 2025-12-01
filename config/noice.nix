{
  plugins.noice = {
    enable = true;
    settings = {
      lsp = {
        message = {
          enabled = true;
          view = "notify";
        };
        progress = {
          enabled = false;
          view = "mini";
        };
      };
      messages = {
        enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
        view = "mini";
      };
      notify = {
        enabled = true;
        view = "notify";
        timeout = 5000; # 5 seconds instead of default 1 second
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>nn";
      action = "<cmd>Noice<CR>";
      options = {
        silent = true;
        desc = "Show Noice (notifications/messages history)";
      };
    }
  ];
}

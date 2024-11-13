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
        enabled = false;
      };
    };
  };
}

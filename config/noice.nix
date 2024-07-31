{
  plugins.noice = {
    enable = true;
    notify = {
      enabled = false;
    };
    messages = {
      enabled = true; # Adds a padding-bottom to neovim statusline when set to false for some reason
      view = "mini";
    };
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
  };
}

{
  plugins = {
    codesnap = {
      enable = true;
      settings = {
        has_breadcrumbs = true;
        has_line_numbers = true;
      };
    };
  };

  keymaps = [{
    mode = "x";
    key = "<leader>cs";
    action = "<cmd>CodeSnap<cr>";
    options = {
      desc = "CodeSnap Capture to clipboard";
    };
  }];
}

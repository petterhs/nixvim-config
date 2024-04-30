{pkgs, ... }:
{

  plugins = {
    bufferline = {
      enable = true;
      diagnostics = "nvim_lsp";
    };
  };

}

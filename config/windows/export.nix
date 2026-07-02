{ lib, ... }:
{
  # Portable init.lua is loaded directly on Windows, not via the Nix wrapper.
  wrapRc = lib.mkForce false;
  impureRtp = lib.mkForce true;

  # vim.pack.add installs everything up front; lazy loading breaks that model.
  plugins = {
    lz-n.enable = lib.mkForce false;
  }
  // lib.genAttrs [
    "toggleterm"
    "obsidian"
    "bufferline"
    "todo-comments"
    "markdown-preview"
    "neotest"
    "dap"
    "dap-go"
    "dap-python"
  ] (_: {
    lazyLoad.enable = lib.mkForce false;
  });
}

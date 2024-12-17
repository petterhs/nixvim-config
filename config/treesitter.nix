{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    settings.highlight.enable = true;
    settings.indent.enable = true;
  };

  plugins.treesitter-context.enable = true;
  plugins.treesitter-refactor.enable = true;
  plugins.treesitter-textobjects.enable = true;

}

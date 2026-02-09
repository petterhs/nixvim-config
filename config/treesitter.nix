{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      indent.enable = true;
      refactor = {
        highlightDefinitions.enable = true;
        highlightCurrentScope.enable = true;
        smartRename.enable = true;
        navigation.enable = true;
      };
      textobjects = {
        enable = true;
      };
    };
  };

  plugins.treesitter-context.enable = true;
}

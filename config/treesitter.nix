{ pkgs, ... }:
{
  plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
      rust
      lua
      bash
      python
      typescript
      javascript
      c
      cpp
      doxygen
      gitignore
      markdown
      markdown_inline
      regex
      vim
      vimdoc
      json
    ];
  };

  plugins.treesitter-context.enable = true;
  plugins.treesitter-refactor.enable = true;
  plugins.treesitter-textobjects.enable = true;

}

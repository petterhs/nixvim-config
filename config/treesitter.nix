{pkgs, ... }:
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
      ];
    };

    plugins.treesitter-context.enable = true;

}

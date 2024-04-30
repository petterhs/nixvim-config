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
      ];
    };

    plugins.treesitter-context.enable = true;

}

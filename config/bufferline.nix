{pkgs, ... }:
{
  colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "mocha";
  };

  plugins = {
    bufferline = {
      enable = true;
    };

    lualine = {
      enable = true;
    };

    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        rust-analyzer = {
          installCargo = true;
          installRustc = true;
          enable = true;
        };
        tsserver.enable = true;
      };
    };

    gitsigns.enable = true;
    fugitive.enable = true;

    nvim-tree.enable = true;


    tmux-navigator.enable = true;

    treesitter = {
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

    treesitter-context.enable = true;


    telescope.enable = true;

    which-key.enable = true;

    harpoon.enable = true;

    indent-blankline.enable = true;


    trouble.enable = true;

    undotree.enable = true;

    todo-comments.enable = true;

    persistence.enable = true;
   
    # searchbox
    # friendly-snippets.enable = false;
    # fine-cmdline
    # fugitive
  };

  opts = {
    number = true;
    shiftwidth = 2;
    relativenumber = true;
    termguicolors = true;
  };

  globals = {
    mapleader = " ";
  };
}

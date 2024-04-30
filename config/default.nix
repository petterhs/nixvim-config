{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./nvimtree.nix
    ./git.nix
    ./telescope.nix
    ./treesitter.nix
    ./lsp.nix
    ./toggleterm.nix
  ];
  
  colorschemes.catppuccin = {
    enable = true;
    settings.flavour = "mocha";
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-s>";
      action = "<ESC>:w<CR>";
      options.silent = true;
      options.desc = "Save buffer";
    }
    {
      mode = "i";
      key = "<C-s>";
      action = "<ESC>:w<CR>";
      options.silent = true;
      options.desc = "Save buffer";
    }
    {
      mode = "i";
      key = "jj";
      action = "<ESC>";
      options.silent = true;
      options.desc = "Escape";
    }
    {
      mode = "v";
      key = "jj";
      action = "<ESC>";
      options.silent = true;
      options.desc = "Escape";
    }
  ];

  plugins = {
    lualine = {
      enable = true;
    };


    tmux-navigator.enable = true;

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
    wrap = false;
    termguicolors = true;
  };

  globals = {
    mapleader = " ";
  };
}

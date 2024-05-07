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
    ./cmp.nix
    ./auto-session.nix
  ];
  
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      integrations = {
        notify = true;
	noice = true;
	lsp_trouble = true;
	leap = true;
      };
    };
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
      mode = "n";
      key = "<leader>x";
      action = "<ESC>:bd<CR>";
      options.silent = true;
      options.desc = "Escape";
    }
  ];

  plugins = {
    lualine = {
      enable = true;
    };

    # auto-detect tabstop and shiftwidth
    sleuth.enable = true;

    comment.enable = true;

    noice.enable = true;

    notify.enable = true;

    leap.enable = true;

    tmux-navigator.enable = true;

    which-key.enable = true;

    harpoon.enable = true;

    indent-blankline.enable = true;

    trouble.enable = true;

    undotree.enable = true;

    todo-comments.enable = true;

    persistence.enable = true;
   
  };

  opts = {
    number = true;
    relativenumber = true;
    wrap = false;
    termguicolors = true;
    scrolloff = 10;
  };

  globals = {
    mapleader = " ";
  };
}

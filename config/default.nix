{ lib, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./bufferline.nix
    ./diffview.nix
    ./nvimtree.nix
    ./git.nix
    ./telescope.nix
    ./treesitter.nix
    ./lsp.nix
    ./toggleterm.nix
    ./cmp.nix
    ./auto-session.nix
    ./markdown-preview.nix
    ./grapple.nix
    ./undotree.nix
    ./noice.nix
    ./flash.nix
    ./codesnap.nix
    ./none-ls.nix
    ./lint.nix
    # ./obsidian.nix
  ];

  highlight.ExtraWhitespace.bg = "red";

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
    {
      mode = "n";
      key = "<M-k>";
      action = ":move-2<CR>";
      options.desc = "Move line up";
    }
    {
      mode = "n";
      key = "<M-j>";
      action = ":move+<CR>";
      options.desc = "Move line down";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
      options.desc = "Move selected lines up";
    }
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
      options.desc = "Move selected lines down";
    }
    {
      mode = "n";
      key = "<S-h>";
      action = "<cmd>bprevious<cr>";
      options = {
        desc = "Previous Buffer";
      };
    }
    {
      mode = "n";
      key = "<S-l>";
      action = "<cmd>bnext<cr>";
      options = {
        desc = "Next Buffer";
      };
    }
  ];

  plugins = {
    lualine = {
      enable = true;
    };
    web-devicons = {
      enable = true;
    };

    # auto-detect tabstop and shiftwidth
    sleuth.enable = true;

    comment.enable = true;

    notify = {
      enable = true;
      timeout = 1000;
    };

    # leap.enable = true;

    tmux-navigator.enable = true;

    which-key.enable = true;

    indent-blankline.enable = true;

    trouble.enable = true;

    todo-comments.enable = true;

    persistence.enable = true;

    nvim-autopairs.enable = true;

    package-info.enable = true;

  };

  opts = {
    number = true;
    relativenumber = true;
    wrap = false;
    termguicolors = true;
    scrolloff = 10;
    swapfile = false;
    undofile = true;

    timeoutlen = 10;

    updatetime = 50;
  };

  globals = {
    mapleader = " ";
  };
}

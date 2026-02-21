{ lib, ... }:
{
  # Import all your configuration modules here
  imports = [
    ./autocmd.nix
    ./bufferline.nix
    ./diffview.nix
    ./git.nix
    ./treesitter.nix
    ./lsp.nix
    ./toggleterm.nix
    ./cmp.nix
    ./auto-session.nix
    ./markdown-preview.nix
    ./undotree.nix
    ./noice.nix
    ./flash.nix
    ./codesnap.nix
    ./none-ls.nix
    ./lint.nix
    ./ufo.nix
    ./dap.nix
    ./neotest.nix
    ./obsidian.nix
    ./hardtime.nix
    ./snacks.nix
    ./opencode.nix
    ./mini.nix
  ];

  highlight.ExtraWhitespace.bg = "red";
  # Custom highlight for snacks indent guides (darker, less visible)
  highlight.SnacksIndent = {
    fg = "#3a3a3a"; # Dark gray, less visible
    bg = "NONE";
    default = true;
  };

  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      integrations = {
        cmp = true;
        noice = true;
        lsp_trouble = true;
        leap = true;
        treesitter = true;
        mini = true;
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
      options.desc = "Close buffer";
    }
    {
      mode = "n";
      key = "<leader>X";
      action.__raw = ''
        function()
          local current_buf = vim.api.nvim_get_current_buf()
          
          -- Close all buffers except current and unsaved ones
          -- This includes both loaded and unloaded buffers (from session recovery)
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            if buf ~= current_buf then
              -- Check if buffer is modified (unsaved)
              local is_modified = false
              if vim.api.nvim_buf_is_loaded(buf) then
                is_modified = vim.bo[buf].modified
              else
                -- For unloaded buffers, check if they have unsaved changes
                -- by trying to get buffer info
                local info = vim.fn.getbufinfo(buf)
                if #info > 0 then
                  is_modified = info[1].changed == 1
                end
              end
              
              -- Delete buffer if not modified
              if not is_modified then
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
          end
          
          -- Close all tabs except the current one
          vim.cmd("tabonly")
        end
      '';
      options.desc = "Close all other buffers and tabs, keep current and unsaved";
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

    # leap.enable = true;

    tmux-navigator.enable = true;

    which-key.enable = true;

    trouble.enable = true;

    todo-comments.enable = true;

    persistence.enable = true;

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
    conceallevel = 2;

    timeoutlen = 10;

    updatetime = 50;

    colorcolumn = "80";
  };

  extraConfigLua = ''
    if vim.fn.executable('xclip') == 1
      or vim.fn.executable('xsel') == 1
      or vim.fn.executable('wl-copy') == 1
      or vim.fn.executable('pbcopy') == 1 then
      vim.o.clipboard = 'unnamedplus'
    end
  '';

  globals = {
    mapleader = " ";
  };
}

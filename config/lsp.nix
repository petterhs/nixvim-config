{ pkgs, ... }:
{
  plugins.lsp = {
    enable = true;
    servers = {
      eslint = {
        enable = true;
      };
      nixd.enable = true;
      rust_analyzer = {
        installCargo = true;
        installRustc = true;
        enable = true;
      };
      ts_ls.enable = true;
      clangd = {
        cmd = [
          "clangd"
          "--background-index"
          "--query-driver=**"
        ];
        enable = true;
        package = null;
      };
      pyright = {
        enable = true;
      };
      svelte = {
        enable = true;
        settings.svelte.enable-ts-plugin = true;
      };
      html = {
        enable = true;
      };
      tailwindcss = {
        enable = true;
      };
      kotlin_language_server = {
        enable = true;
      };
      marksman = {
        enable = true;
      };
      gopls = {
        enable = true;
      };
    };

    keymaps = {
      diagnostic = {
        "]d" = "goto_next";
        "[d" = "goto_prev";
      };
      lspBuf = {
        K = "hover";
        gr = "references";
        gd = "definition";
        gi = "implementation";
        gt = "type_definition";
        "<leader>ra" = "rename";
      };
    };
  };


  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return false
          end

          return { timeout_ms = 200, lsp_fallback = true }
        end
      '';
      default_format_opts = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
      notify_on_error = true;
      formatters_by_ft = {
        liquidsoap = [ "liquidsoap-prettier" ];
        html = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        css = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        javascript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        javascriptreact = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        typescript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        typescriptreact = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        svelte = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        python = [ "black" ];
        lua = [ "stylua" ];
        nix = [ "alejandra" ];
        markdown = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        yaml = [
          "yamllint"
          "yamlfmt"
        ];
        go = [
          "gofumpt"
          "goimports"
        ];
      };
    };
  };

  extraPackages = with pkgs; [
    nodePackages.prettier
    nodePackages.svelte-language-server
    nodePackages."@tailwindcss/language-server"
    gopls
    gofumpt
    gotools # Contains goimports and other Go tools
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>ft";
      action.__raw = ''
        function()
          if vim.g.disable_autoformat then
            vim.g.disable_autoformat = false
            vim.notify("Format on save enabled", vim.log.levels.INFO)
          else
            vim.g.disable_autoformat = true
            vim.notify("Format on save disabled", vim.log.levels.INFO)
          end
        end
      '';
      options = {
        silent = true;
        desc = "Toggle format on save";
      };
    }
    {
      mode = "n";
      key = "<leader>de";
      action.__raw = ''
        function()
          vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
        end
      '';
      options = {
        silent = true;
        desc = "Show diagnostic at cursor";
      };
    }
    {
      mode = "n";
      key = "gl";
      action.__raw = ''
        function()
          vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
        end
      '';
      options = {
        silent = true;
        desc = "Show diagnostic at cursor";
      };
    }
  ];

  # Configure diagnostics to show on cursor hold (optional, can be disabled)
  extraConfigLua = ''
    -- Show diagnostics in a float when cursor is held on a line with diagnostics
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        local opts = {
          focus = false,
          border = "rounded",
          scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
      end,
    })
  '';
}

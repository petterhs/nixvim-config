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

  plugins.lsp-format = {
    enable = true;
  };

  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lspFallback = true;
        timeoutMs = 500;
      };
      notifyOnError = true;
      formattersByFt = {
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
      };
    };
  };

  extraPackages = with pkgs; [
    nodePackages.prettier
    nodePackages.svelte-language-server
    nodePackages."@tailwindcss/language-server"
  ];
}

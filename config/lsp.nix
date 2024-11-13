{

  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      rust_analyzer = {
        installCargo = true;
        installRustc = true;
        enable = true;
      };
      ts_ls.enable = true;
      clangd.enable = true;
      pyright = {
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
}

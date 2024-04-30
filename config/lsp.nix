{pkgs, ... }:
{

  plugins.lsp = {
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
      };
    };
  };
}

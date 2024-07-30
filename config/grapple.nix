{ pkgs, ... }: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "grapple.nvim";
      version = "1.0";
      src = pkgs.fetchFromGitHub {
        owner = "cbochs";
        repo = "grapple.nvim";
        rev = "59d458e378c4884f22b7a68e61c07ed3e41aabf0";
        hash = "sha256-4k8BE9i8kG4pL7Fj0xw9cG8sjA0u4jzJ40WSV/lBFhY=";
      };
    })
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>a";
      action = "<CMD> Grapple toggle <CR>";
      options = { desc = "Grapple Toggle"; };
    }

    {
      mode = "n";
      key = "<leader>h";
      action = "<CMD> Grapple toggle_tags <CR>";
      options = { desc = "Grapple Toggle tags"; };
    }

    {
      mode = "n";
      key = "<leader>K";
      action = "<CMD> Grapple toggle_scopes <CR>";
      options = { desc = "Grapple Toggle scopes"; };
    }

    {
      mode = "n";
      key = "<leader>n";
      action = "<CMD> Grapple cycle forward <CR>";
      options = { desc = "Grapple Cycle forward"; };
    }

    {
      mode = "n";
      key = "<leader>p";
      action = "<CMD> Grapple cycle backward <CR>";
      options = { desc = "Grapple Cycle backward"; };
    }

    {
      mode = "n";
      key = "<leader>1";
      action = "<CMD> Grapple select index=1<CR>";
      options = { desc = "Grapple Select 1"; };
    }

    {
      mode = "n";
      key = "<leader>2";
      action = "<CMD> Grapple select index=2<CR>";
      options = { desc = "Grapple Select 2"; };
    }

    {
      mode = "n";
      key = "<leader>3";
      action = "<CMD> Grapple select index=3<CR>";
      options = { desc = "Grapple Select 3"; };
    }

    {
      mode = "n";
      key = "<leader>4";
      action = "<CMD> Grapple select index=4<CR>";
      options = { desc = "Grapple Select 4"; };
    }
  ];

  extraConfigLua = ''
    require('grapple').setup({
      scope = "git",
    })
  '';
}

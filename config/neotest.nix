{ lib, pkgs, ... }:
{
  plugins = {
    neotest = {
      enable = true;
    };
  };

  extraPlugins = with pkgs.vimPlugins; [
    neotest-python
    neotest-rust
    neotest-go
  ];

  extraConfigLua = ''
    require("neotest").setup({
      adapters = {
        require("neotest-python")({
          dap = { justMyCode = false },
        }),
        require("neotest-rust")({
          args = { "--no-capture" },
        }),
        require("neotest-go")({
          args = { "-tags=integration" },
        }),
      },
    })
  '';

  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>lua require('neotest').run.run()<CR>";
      options = {
        silent = true;
        desc = "Run nearest test";
      };
    }
    {
      mode = "n";
      key = "<leader>tf";
      action = "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>";
      options = {
        silent = true;
        desc = "Run tests in current file";
      };
    }
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>";
      options = {
        silent = true;
        desc = "Debug nearest test";
      };
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = "<cmd>lua require('neotest').summary.toggle()<CR>";
      options = {
        silent = true;
        desc = "Toggle test summary";
      };
    }
    {
      mode = "n";
      key = "<leader>to";
      action = "<cmd>lua require('neotest').output.open()<CR>";
      options = {
        silent = true;
        desc = "Open test output";
      };
    }
    {
      mode = "n";
      key = "<leader>tp";
      action = "<cmd>lua require('neotest').output_panel.toggle()<CR>";
      options = {
        silent = true;
        desc = "Toggle test output panel";
      };
    }
  ];
}

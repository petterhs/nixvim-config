{
  config,
  lib,
  pkgs,
  ...
}:
{

  # Source: https://github.com/khaneliman/khanelivim

  extraPackages =
    with pkgs;
    [
      coreutils
      lldb
    ]
    ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
      gdb
    ];

  plugins = {
    dap = {
      enable = true;
      adapters = {
        executables = {
          lldb = {
            command = lib.getExe' pkgs.lldb "lldb-dap";
          };
        };

        servers = {
          codelldb = {
            port = 13000;
            executable = {
              command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
              args = [
                "--port"
                "13000"
              ];
            };
          };
        };
      };

      configurations =
        let
          program.__raw = ''
            function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
            end
          '';

          codelldb-config = {
            inherit program;
            name = "Launch (CodeLLDB)";
            type = "codelldb";
            request = "launch";
            cwd = ''''${workspaceFolder}'';
            stopOnEntry = false;
          };


          lldb-config = {
            inherit program;
            name = "Launch (LLDB)";
            type = "lldb";
            request = "launch";
            cwd = ''''${workspaceFolder}'';
            stopOnEntry = false;
          };
        in
        {
          c = [ lldb-config ];

          cpp = [
            codelldb-config
            lldb-config
          ];

          rust = lib.mkIf (!config.plugins.rustaceanvim.enable) [
            codelldb-config
            lldb-config
          ];
        };

      signs = {
        dapBreakpoint = {
          text = "";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "";
          texthl = "DapBreakpointCondition";
        };
        dapBreakpointRejected = {
          text = "";
          texthl = "DapBreakpointRejected";
        };
        dapLogPoint = {
          text = "";
          texthl = "DapLogPoint";
        };
        dapStopped = {
          text = "";
          texthl = "DapStopped";
        };
      };
    };
    dap-go = {
      enable = true;
      settings.delve.path = "${lib.getExe pkgs.delve}";
    };
    dap-python.enable = true;

    which-key.settings.spec = lib.optionals config.plugins.dap.enable [
      {
        __unkeyed-1 = "<leader>d";
        mode = "n";
        desc = "Debug";
        # icon = " ";
      }
    ];
  };

  keymaps = lib.optionals (config.plugins.dap.enable && !config.plugins.dap.lazyLoad.enable) [
    {
      mode = "n";
      key = "<leader>db";
      # action = "<CMD>DapToggleBreakpoint<CR>";
      action = "<CMD>lua require('dap').toggle_breakpoint()<CR>";
      options = {
        desc = "Breakpoint toggle";
      };
    }
    {
      mode = "n";
      key = "<leader>dc";
      # action = "<CMD>DapContinue<CR>";
      action = "<CMD>lua require('dap').continue()<CR>";
      options = {
        desc = "Continue Debugging (Start)";
      };
    }
    {
      mode = "n";
      key = "<leader>dC";
      action = "<CMD>lua require('dap').run_to_cursor()<CR>";
      options = {
        desc = "Run to cursor";
      };
    }
    {
      mode = "n";
      key = "<leader>dg";
      action = "<CMD>lua require('dap').goto_()<CR>";
      options = {
        desc = "Go to line (no execute)";
      };
    }
    {
      mode = "n";
      key = "<leader>di";
      # action = "<CMD>DapStepInto<CR>";
      action = "<CMD>lua require('dap').step_into()<CR>";
      options = {
        desc = "Step Into";
      };
    }
    {
      mode = "n";
      key = "<leader>dj";
      action = "<CMD>lua require('dap').down()<CR>";
      options = {
        desc = "Down";
      };
    }
    {
      mode = "n";
      key = "<leader>dk";
      action = "<CMD>lua require('dap').up()<CR>";
      options = {
        desc = "Up";
      };
    }
    {
      mode = "n";
      key = "<leader>dl";
      action = "<CMD>lua require('dap').run_last()<CR>";
      options = {
        desc = "Run Last";
      };
    }
    {
      mode = "n";
      key = "<leader>do";
      # action = "<CMD>DapStepOut<CR>";
      action = "<CMD>lua require('dap').step_out()<CR>";
      options = {
        desc = "Step Out";
      };
    }
    {
      mode = "n";
      key = "<leader>dO";
      # action = "<CMD>DapStepOver<CR>";
      action = "<CMD>lua require('dap').step_over()<CR>";
      options = {
        desc = "Step Over";
      };
    }
    {
      mode = "n";
      key = "<leader>dp";
      action = "<CMD>lua require('dap').pause()<CR>";
      options = {
        desc = "Pause";
      };
    }
    {
      mode = "n";
      key = "<leader>dr";
      # action = "<CMD>DapToggleRepl<CR>";
      action = "<CMD>lua require('dap').repl.toggle()<CR>";
      options = {
        desc = "Toggle REPL";
      };
    }
    {
      mode = "n";
      key = "<leader>ds";
      action = "<CMD>lua require('dap').session()<CR>";
      options = {
        desc = "Session";
      };
    }
    {
      mode = "n";
      key = "<leader>dt";
      # action = "<CMD>DapTerminate<CR>";
      action = "<CMD>lua require('dap').terminate()<CR>";
      options = {
        desc = "Terminate Debugging";
      };
    }
  ];
}

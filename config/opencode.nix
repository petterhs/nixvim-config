{ ... }:
{
  plugins.opencode = {
    enable = true;
    settings = {
      provider = {
        enabled = "tmux";
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>oca";
      action.__raw = ''function() require("opencode").ask("@this: ", { submit = true }) end'';
      options.desc = "Ask opencode about this";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ocx";
      action.__raw = ''function() require("opencode").select() end'';
      options.desc = "Execute opencode action";
    }
    {
      mode = [
        "n"
        "x"
      ];
      key = "<leader>ocp";
      action.__raw = ''function() require("opencode").prompt("@this") end'';
      options.desc = "Add to opencode prompt";
    }
    {
      mode = [
        "n"
        "t"
      ];
      key = "<leader>oct";
      action.__raw = ''function() require("opencode").toggle() end'';
      options.desc = "Toggle opencode";
    }
  ];

  extraConfigLua = ''
    vim.o.autoread = true

    -- Setup which-key for opencode prefix
    local wk = require("which-key")
    wk.add({
      { "<leader>oc", group = "Opencode" },
    })

  '';
}

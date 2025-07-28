{
  plugins = {

    lspkind.enable = true;

    # copilot-vim = {
    #   enable = true;
    #   settings = {
    #     panel.enabled = false;
    #     suggestion.enabled = false;
    #   };
    # };
    #
    # copilot-chat = {
    #   enable = true;
    # };

    # copilot-cmp = {
    #   enable = true;
    # };

    # blink-cmp-copilot = {
    #   enable = true;
    #   autoLoad = true;
    # };

    blink-cmp = {
      enable = true;
      settings = {

        keymap = {
          "<C-b>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-e>" = [
            "hide"
          ];
          "<C-f>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<C-j>" = [
            "select_next"
            "fallback"
          ];
          "<C-k>" = [
            "select_prev"
            "fallback"
          ];
          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
          "<C-y>" = [
            "select_and_accept"
          ];
          "<Down>" = [
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "snippet_backward"
            "fallback"
          ];
          "<Tab>" = [
            "snippet_forward"
            "fallback"
          ];
          "<Up>" = [
            "select_prev"
            "fallback"
          ];
        };

        sources = {
          # copilot = {
          #   async = true;
          #   module = "blink-cmp-copilot";
          #   name = "copilot";
          #   score_offset = 100;
          # };
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            # "copilot"
          ];
        };
      };
    };
  };
}

{
  plugins = {

    lspkind.enable = true;

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          { name = "obsidian"; }
          { name = "nvim_lsp"; }
          { name = "buffer"; }
          { name = "path"; }
          { name = "copilot"; }
        ];
        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-l>" = "cmp.mapping.confirm({ select = true })";
        };
        completion = {
          completeopt = "menu,menuone,noselect";
        };
      };
    };
  };
}

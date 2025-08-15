{ pkgs, ... }:
{

  opts = {
    foldlevel = 99; # keep all folds open
    foldlevelstart = 99; # same for newly opened buffers
    foldenable = true; # folding available, just not auto-folded
  };

  plugins.nvim-ufo = {
    enable = true;

    # Optional: additional ufo setup
    settings = {
      open_fold_hl_timeout = 0;
      provider_selector.__raw = ''
        function(bufnr, filetype, buftype)
          return { 'treesitter', 'indent' }
        end
      '';
    };
  };

  # Optional: add manual fold keymaps
  keymaps = [
    {
      mode = "n";
      key = "zM";
      action.__raw = "require('ufo').closeAllFolds";
    }
    {
      mode = "n";
      key = "zR";
      action.__raw = "require('ufo').openAllFolds";
    }
  ];
}

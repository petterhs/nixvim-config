{ pkgs, ... }:
{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      text = [ ];
      markdown = [ ];
      rst = [
        "rstcheck"
        "vale"
      ];
      nix = [ "nix" ];
      css = [ "stylelint" ];
      scss = [ "stylelint" ];
      dockerfile = [ "hadolint" ];
      python = [ "ruff" ];
      javascript = [ "eslint_d" ];
      typescript = [ "eslint_d" ];
      javascriptreact = [ "eslint_d" ];
      typescriptreact = [ "eslint_d" ];
      svelte = [ "eslint_d" ];
    };
  };

  extraPackages = with pkgs; [
    stylelint
    hadolint
    ruff
    eslint_d
    rstcheck
    vale
    nix
  ];
}

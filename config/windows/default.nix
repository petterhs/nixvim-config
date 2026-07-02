{ lib, ... }:
{
  imports = [
    ../default.nix
    ./export.nix
    ./dap.nix
    ./cmp.nix
  ];

  plugins.opencode.enable = lib.mkForce false;
  plugins.tmux-navigator.enable = lib.mkForce false;
  plugins.obsidian.enable = lib.mkForce false;
  plugins.copilot-cmp.enable = lib.mkForce false;
  plugins.copilot-lsp.enable = lib.mkForce false;
  plugins.copilot-lua.enable = lib.mkForce false;

  plugins.lsp.servers.nixd.enable = lib.mkForce false;

  plugins.conform-nvim.settings.formatters_by_ft.nix = lib.mkForce [ ];
  plugins.lint.lintersByFt.nix = lib.mkForce [ ];

  extraConfigLua = lib.mkAfter ''
    if vim.fn.has("win32") == 1 then
      if vim.fn.executable("win32yank.exe") == 1 then
        vim.g.clipboard = {
          name = "win32yank",
          copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
          },
          paste = {
            ["+"] = "win32yank.exe -o --crlf",
            ["*"] = "win32yank.exe -o --crlf",
          },
          cache_enabled = true,
        }
      end
    end
  '';
}

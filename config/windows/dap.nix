{ lib, ... }:
{
  plugins.dap.adapters.servers.codelldb.executable.command = lib.mkForce "codelldb";
  plugins.dap.adapters.executables.lldb.command = lib.mkForce "lldb-dap";
  plugins.dap-go.settings.delve.path = lib.mkForce "dlv";
}

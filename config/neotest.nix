{ lib, ... }:
{
  plugins = {
    neotest = {
      enable = true;
      settings = {
        neotest = {
          adapters = {
            python = {
              command = "python";
              args = [
                "-m"
                "neotest"
              ];
            };
            rust = {
              command = "cargo";
              args = [ "test" ];
            };
          };
        };
      };
    };
  };
}

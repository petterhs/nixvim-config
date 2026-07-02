{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixvim
    , flake-parts
    , ...
    } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { pkgs
        , system
        , ...
        }:
        let
          lib = pkgs.lib;
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = { };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;

          windows = import ./windows/export-lib.nix {
            inherit lib pkgs nixvim' nixvim;
          };
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
            windows = nixvimLib.check.mkTestDerivationFromNixvimModule windows.windowsNvimModule;
          };

          packages = {
            default = nvim;
            windows = windows.windowsNvim;
            windows-export = windows.export;
          };

          apps = {
            export-windows = {
              type = "app";
              program = "${pkgs.writeShellScript "export-windows" ''
                exec ${pkgs.bash}/bin/bash ${./windows/export.sh} ${system}
              ''}";
            };
          };
        };
    };
}

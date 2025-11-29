{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "dooing";
      src = pkgs.fetchFromGitHub {
        owner = "atiladefreitas";
        repo = "dooing";
        rev = "v2.8.2";
        hash = "sha256-m6JCXWXbBWKrFd57CgSvrnXQNLIJ15nyfSHdzn+XxkA=";
      };
    })
  ];
}

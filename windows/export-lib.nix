{
  lib,
  pkgs,
  nixvim',
  nixvim,
}:
let
  toLua = import "${nixvim}/lib/to-lua.nix" { inherit lib; };
  windowsNvimModule = {
    inherit pkgs;
    module = import ../config/windows;
  };

  windowsNvim = nixvim'.makeNixvimWithModule windowsNvimModule;
  cfg = windowsNvim.passthru.config;

  isEnabled =
    plugin:
    let
      result = lib.tryEval (lib.hasAttr "enable" plugin && plugin.enable);
    in
    result.success && result.value;

  getPluginSpec =
    package:
    let
      homepageResult = lib.tryEval (
        lib.hasAttr "meta" package
        && lib.hasAttr "homepage" package.meta
        && lib.hasPrefix "https://" package.meta.homepage
      );
      revResult = lib.tryEval (
        if lib.hasAttr "src" package && lib.hasAttr "rev" package.src then package.src.rev else null
      );
    in
    if !homepageResult.success || !homepageResult.value then
      null
    else
      let
        homepage = lib.removeSuffix "/" package.meta.homepage;
      in
      if revResult.success && revResult.value != null then
        {
          src = homepage;
          version = revResult.value;
        }
      else
        homepage;

  pluginSpecs =
    lib.pipe cfg.plugins [
      (lib.filterAttrs (_: isEnabled))
      lib.attrValues
      (map (plugin: plugin.package))
      (lib.concat cfg.extraPlugins)
      (map getPluginSpec)
      (lib.filter (spec: spec != null))
      lib.unique
    ];

  enabledLsps = [
    "eslint"
    "rust_analyzer"
    "ts_ls"
    "clangd"
    "pyright"
    "svelte"
    "html"
    "tailwindcss"
    "kotlin_language_server"
    "marksman"
    "gopls"
  ];

  formattersByFt = cfg.plugins.conform-nvim.settings.formatters_by_ft or { };
  lintersByFt = cfg.plugins.lint.lintersByFt or { };

  linuxOnlyTools = [
    "gdb"
    "nix"
    "coreutils"
  ];

  packageNames =
    lib.filter (name: !(lib.elem name linuxOnlyTools)) (
      map (pkg: pkg.pname or pkg.name) cfg.extraPackages
    );

  dependenciesJson = builtins.toJSON {
    neovim = ">= 0.12.0";
    notes = [
      "Install tools below with Scoop, winget, choco, or Mason."
      "Nix-specific tooling (nixd, alejandra, nix linter) is excluded from the Windows export."
      "opencode and tmux-navigator are excluded from the Windows export."
    ];
    languageServers = enabledLsps;
    formattersByFiletype = formattersByFt;
    lintersByFiletype = lintersByFt;
    cliTools = packageNames;
    recommended = [
      "git"
      "nodejs"
      "python"
      "ripgrep"
      "fd"
      "win32yank"
      "codelldb"
      "debugpy"
      "delve"
    ];
  };

  pluginsJson = builtins.toJSON {
    count = lib.length pluginSpecs;
    plugins = pluginSpecs;
  };

  portableInit =
    ''
      vim.pack.add(${toLua.toLuaObject pluginSpecs})
    ''
    + (lib.readFile cfg.build.initSource);

in
{
  inherit windowsNvim windowsNvimModule pluginSpecs;

  export = pkgs.runCommand "windows-neovim-export" { } ''
    mkdir -p $out
    cat > $out/init.lua <<'EOF'
${portableInit}
EOF
    cp ${pkgs.writeText "plugins.json" pluginsJson} $out/plugins.json
    cp ${pkgs.writeText "dependencies.json" dependenciesJson} $out/dependencies.json
  '';
}

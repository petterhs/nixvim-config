# Nixvim template

This template gives you a good starting point for configuring nixvim standalone.

## Configuring

To start configuring, just add or modify the nix files in `./config`.
If you add a new configuration file, remember to add it to the
[`config/default.nix`](./config/default.nix) file

## Testing your new configuration

To test your configuration simply run the following command

```
nix run .
```

## Native Windows usage

This repo can export a portable Lua config for native Windows Neovim (no WSL, no Nix on Windows).

### How it works

1. Linux/macOS config lives in `config/` and is built with Nix (`nix run .`).
2. A Windows overlay in `config/windows/` disables Linux-only features (opencode, tmux-navigator, nix tooling).
3. CI exports portable files and publishes them as GitHub release assets (not committed to git):
   - `init.lua` — full Neovim config with `vim.pack.add()` plugin installs
   - `plugins.json` — pinned plugin sources
   - `dependencies.json` — LSP/formatter/linter tooling to install on Windows
4. Pushes to `main` update a rolling pre-release tagged [`windows-latest`](../../releases/tag/windows-latest).
5. Published releases and pre-releases also receive the same assets when created.

### Requirements on Windows

- Neovim **0.12+** (uses native `vim.pack.add()`)
- Git, Node.js, Python, ripgrep, and other tools listed in [`windows/DEPENDENCIES.md`](./windows/DEPENDENCIES.md)

### Setup on Windows

1. Clone this repository:

```powershell
git clone <your-repo-url> $env:USERPROFILE\nixvim
cd $env:USERPROFILE\nixvim
```

2. Download the latest exported config from GitHub releases:

```powershell
powershell -ExecutionPolicy Bypass -File .\windows\install.ps1
```

This fetches the `windows-latest` pre-release by default. For a specific version:

```powershell
powershell -ExecutionPolicy Bypass -File .\windows\install.ps1 -Tag v0.1.0
```

3. Point Neovim at the bootstrap entry point (the bootstrap resolves Windows symlinks correctly):

```powershell
$nvimConfig = "$env:LOCALAPPDATA\nvim"
New-Item -ItemType Directory -Force -Path $nvimConfig | Out-Null
cmd /c mklink "$nvimConfig\init.lua" "$env:USERPROFILE\nixvim\windows\bootstrap\init.lua"
```

Alternatively, symlink `windows\generated\init.lua` directly to `%LOCALAPPDATA%\nvim\init.lua`.

4. Install external dependencies (see [`windows/DEPENDENCIES.md`](./windows/DEPENDENCIES.md)).

5. Start Neovim. The first launch downloads plugins via `vim.pack.add()`.

### Export locally (optional)

On a machine with Nix, for debugging only:

```bash
./windows/export.sh
# or
nix run .#export-windows
```

Output goes to `windows/generated/` (gitignored).

### Windows overlay details

The overlay in `config/windows/` disables:

- `opencode` (tmux provider)
- `tmux-navigator`
- `obsidian`
- `nixd`, nix formatter, and nix linter
- Copilot cmp source (plugin not configured)
- Nix store paths in DAP adapters (replaced with generic command names)

It also fixes `<leader>gl` to use the snacks `git_log` picker (same as the Linux config).

### Keeping Windows in sync

After editing `config/` on Linux:

1. Push to `main` — CI updates the `windows-latest` pre-release automatically
2. On Windows, run `powershell ./windows/install.ps1` again

For versioned snapshots, create a GitHub release or pre-release; CI attaches the export to that tag as well.

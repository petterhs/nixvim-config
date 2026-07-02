# Windows dependencies

The exported `init.lua` installs Neovim plugins via `vim.pack.add()`. External CLI tools must be installed separately on Windows and available on your `PATH`.

## Required

| Tool | Purpose |
| --- | --- |
| [Neovim](https://neovim.io/) 0.12+ | Native plugin manager (`vim.pack.add`) |
| [Git](https://git-scm.com/download/win) | gitsigns, neogit, diffview |
| [Node.js](https://nodejs.org/) | ESLint, Prettier, markdown-preview, JS/TS tooling |
| [Python](https://www.python.org/downloads/windows/) | pyright, debugpy, neotest-python |
| [ripgrep](https://github.com/BurntSushi/ripgrep/releases) | snacks picker grep |
| [fd](https://github.com/sharkdp/fd/releases) | snacks picker files (optional but recommended) |

## Recommended

| Tool | Purpose |
| --- | --- |
| [win32yank](https://github.com/equalsraf/win32yank) | System clipboard integration |
| [Scoop](https://scoop.sh/) or [winget](https://learn.microsoft.com/en-us/windows/package-manager/winget/) | Easy CLI installs |
| [Mason](https://github.com/willothy/mason.nvim) | Optional: install LSPs/formatters from inside Neovim |

## Language servers

These are enabled in the Windows export (see `generated/dependencies.json` for the live list):

- eslint, ts_ls, pyright, rust-analyzer, clangd, gopls
- svelte, html, tailwindcss, kotlin_language_server, marksman

Install via Mason, Scoop, or npm/global packages. Examples with Scoop:

```powershell
scoop install gopls rust-analyzer clangd nodejs python git ripgrep fd win32yank
npm install -g prettier eslint_d typescript-language-server svelte-language-server @tailwindcss/language-server
```

## Formatters and linters

| Tool | Used for |
| --- | --- |
| prettier / prettierd | JS/TS, HTML, CSS, Markdown, Svelte |
| black | Python |
| stylua | Lua |
| gofumpt, goimports | Go |
| ruff | Python linting |
| eslint_d | JS/TS linting |
| stylelint | CSS/SCSS |
| hadolint | Dockerfile |
| markdownlint-cli2 | Markdown |
| golangci-lint | Go |
| clippy | Rust (via cargo) |

## Debug adapters

| Tool | Used for |
| --- | --- |
| codelldb | C/C++/Rust debugging |
| debugpy | Python debugging |
| delve (`dlv`) | Go debugging |

The Windows overlay uses generic command names (`codelldb`, `lldb-dap`, `dlv`) instead of Nix store paths.

## Excluded on Windows

These are disabled in `config/windows/` and omitted from the export:

- opencode (tmux provider)
- tmux-navigator
- nixd, alejandra, nix linter

## Generated manifest

CI publishes these files as GitHub release assets (not stored in git):

- `init.lua` — portable Neovim config
- `plugins.json` — pinned plugin sources
- `dependencies.json` — machine-readable dependency list

On Windows, download them with:

```powershell
powershell -ExecutionPolicy Bypass -File .\windows\install.ps1
```

Pushes to `main` update the rolling pre-release [`windows-latest`](../../releases/tag/windows-latest). Versioned releases and pre-releases receive the same assets when published.

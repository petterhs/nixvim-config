# AGENTS.md - Nixvim Configuration

## Build/Test Commands
- **Build/Test**: `nix flake check` - Verifies configuration is valid and runs tests
- **Run**: `nix run .` - Start nixvim with current configuration
- **Single test**: Use neotest plugin within nvim for language-specific testing

## Code Style Guidelines
- **Language**: Nix configuration files (.nix)
- **Imports**: Use relative imports in config/default.nix, add new modules to imports list
- **Formatting**: Follow existing indentation (2 spaces), use attribute sets for configuration
- **Structure**: Each plugin gets its own .nix file in config/ directory
- **Naming**: Use kebab-case for filenames (e.g., auto-session.nix, markdown-preview.nix)
- **Plugin config**: Use `plugins.pluginname = { enable = true; settings = {}; }` pattern
- **Keymaps**: Define in main config with mode, key, action, options.desc for documentation
- **LSP**: Configure servers in lsp.nix with enable = true pattern
- **Linting**: Use lint.nix with lintersByFt for file-type specific linters
- **Error handling**: Nix will fail evaluation on syntax errors, use nix flake check to validate

## Architecture
- Main config in config/default.nix imports all module files
- Each plugin/feature gets dedicated .nix file in config/
- Uses nixvim framework for type-safe neovim configuration
- Flake-based project with nixpkgs and nixvim inputs
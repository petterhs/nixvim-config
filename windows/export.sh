#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT="$ROOT/windows/generated"
SYSTEM="${1:-$(nix eval --impure --raw --expr 'builtins.currentSystem' 2>/dev/null || echo x86_64-linux)}"

cd "$ROOT"
mkdir -p "$OUT"

STORE_PATH="$(nix build ".#packages.${SYSTEM}.windows-export" --no-link --print-out-paths)"

cp -f "$STORE_PATH/init.lua" "$OUT/init.lua"
cp -f "$STORE_PATH/plugins.json" "$OUT/plugins.json"
cp -f "$STORE_PATH/dependencies.json" "$OUT/dependencies.json"

echo "Exported Windows Neovim config to $OUT/"
echo "  init.lua"
echo "  plugins.json"
echo "  dependencies.json"

# Download the latest Windows Neovim export from GitHub releases.
# Requires: PowerShell 5.1+ and GitHub CLI (`gh`) or falls back to Invoke-RestMethod.

param(
  [string]$Repo = "",
  [string]$Tag = "windows-latest",
  [string]$OutputDir = ""
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
if (-not $OutputDir) {
  $OutputDir = Join-Path $scriptDir "generated"
}

if (-not $Repo) {
  $remote = git -C (Join-Path $scriptDir "..") remote get-url origin 2>$null
  if ($remote -match "github\.com[:/](.+?)(?:\.git)?$") {
    $Repo = $Matches[1]
  } else {
    throw "Could not detect GitHub repo. Pass -Repo owner/name explicitly."
  }
}

New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null

$assets = @("init.lua", "plugins.json", "dependencies.json")

function Get-ReleaseJson {
  param([string]$Repository, [string]$ReleaseTag)
  $headers = @{ "User-Agent" = "nixvim-windows-install" }
  if ($env:GITHUB_TOKEN) {
    $headers["Authorization"] = "Bearer $env:GITHUB_TOKEN"
  }
  $uri = "https://api.github.com/repos/$Repository/releases/tags/$ReleaseTag"
  return Invoke-RestMethod -Uri $uri -Headers $headers
}

Write-Host "Downloading Windows export from $Repo tag $Tag ..."

$release = Get-ReleaseJson -Repository $Repo -ReleaseTag $Tag

foreach ($name in $assets) {
  $asset = $release.assets | Where-Object { $_.name -eq $name } | Select-Object -First 1
  if (-not $asset) {
    throw "Release '$Tag' is missing asset: $name"
  }

  $dest = Join-Path $OutputDir $name
  Write-Host "  -> $dest"
  Invoke-RestMethod -Uri $asset.browser_download_url -OutFile $dest -Headers @{ "User-Agent" = "nixvim-windows-install" }
}

Write-Host "Done. Symlink or copy windows/bootstrap/init.lua to %LOCALAPPDATA%\nvim\init.lua"

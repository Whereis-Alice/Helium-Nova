# Packages Helium Nova into a .pthm installer.
#   ./build/build.ps1
#   ./build/build.ps1 -PlayniteDir "E:\Software\Playnite" -OutDir ./dist
[CmdletBinding()]
param(
    [string]$PlayniteDir,
    [string]$OutDir
)

$ErrorActionPreference = "Stop"
$repo = Split-Path -Parent $PSScriptRoot
if (-not $OutDir) { $OutDir = Join-Path $repo "dist" }

if (-not $PlayniteDir) {
    $candidates = @(
        $env:PLAYNITE_DIR,
        (Join-Path $env:LOCALAPPDATA "Playnite"),
        "C:\Program Files\Playnite",
        "C:\Program Files (x86)\Playnite"
    ) | Where-Object { $_ }
    $PlayniteDir = $candidates | Where-Object { Test-Path (Join-Path $_ "Toolbox.exe") } | Select-Object -First 1
}
if (-not $PlayniteDir -or -not (Test-Path (Join-Path $PlayniteDir "Toolbox.exe"))) {
    throw "Toolbox.exe not found. Pass -PlayniteDir with your Playnite installation folder."
}
$toolbox = Join-Path $PlayniteDir "Toolbox.exe"
$src = Join-Path $repo "source"

New-Item -ItemType Directory -Path $OutDir -Force | Out-Null
& $toolbox pack $src $OutDir
if ($LASTEXITCODE -ne 0) { throw "toolbox pack failed" }

Get-ChildItem $OutDir -Filter *.pthm | Sort-Object LastWriteTime -Descending |
    Select-Object -First 1 Name, Length, LastWriteTime | Format-List
Write-Host "Done -> $OutDir"

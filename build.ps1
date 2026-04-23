#Requires -Version 5.1
$ErrorActionPreference = "Stop"

$ProjectDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
Set-Location $ProjectDir

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "  AI Data Analyst - Build Automatico" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# ── Controlla Rust ─────────────────────────
try {
    $rustVersion = rustc --version
    Write-Host "[OK] Rust: $rustVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERRORE] Rust non trovato." -ForegroundColor Red
    Write-Host "Installalo da: https://rustup.rs"
    Write-Host "Oppure: winget install Rustlang.Rustup"
    Read-Host "Premi INVIO per uscire"
    exit 1
}

# ── Controlla Tauri CLI ────────────────────
try {
    $tauriVersion = cargo tauri --version
    Write-Host "[OK] Tauri CLI: $tauriVersion" -ForegroundColor Green
} catch {
    Write-Host "[INFO] Installo Tauri CLI..." -ForegroundColor Yellow
    cargo install tauri-cli
    Write-Host "[OK] Tauri CLI installata" -ForegroundColor Green
}

# ── Build ──────────────────────────────────
Write-Host ""
Write-Host "Avvio build in modalita' rilascio..." -ForegroundColor Cyan
Write-Host ""
Set-Location "$ProjectDir\src-tauri"
cargo tauri build

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "  Build completata!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Eseguibile:  $ProjectDir\src-tauri\target\release\AI Data Analyst.exe"
Write-Host "Installer:   $ProjectDir\src-tauri\target\release\bundle\msi\"
Write-Host ""
Read-Host "Premi INVIO per chiudere"

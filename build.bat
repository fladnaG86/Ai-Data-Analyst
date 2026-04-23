@echo off
setlocal EnableDelayedExpansion

echo ==========================================
echo   AI Data Analyst - Build Automaticoecho ==========================================
echo.

:: ── Controlla Rust ─────────────────────────
where rustc >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRORE] Rust non trovato.
    echo.
    echo Scarica e installa da:
    echo   https://rustup.rs
    echo.
    echo Oppure esegui in PowerShell:
    echo   winget install Rustlang.Rustup
    echo.
    pause
    exit /b 1
)
for /f "tokens=*" %%a in ('rustc --version') do echo [OK] Rust: %%a

:: ── Controlla Cargo ──────────────────────
where cargo >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERRORE] Cargo non trovato. Riavvia il terminale dopo l'installazione di Rust.
    pause
    exit /b 1
)

:: ── Controlla Tauri CLI ──────────────────
cargo tauri --version >nul 2>nul
if %errorlevel% neq 0 (
    echo [INFO] Tauri CLI non trovata. Installo...
    cargo install tauri-cli
    echo [OK] Tauri CLI installata
) else (
    for /f "tokens=*" %%a in ('cargo tauri --version') do echo [OK] Tauri CLI: %%a
)

:: ── Build ────────────────────────────────
echo.
echo Avvio build in modalita' rilascio...
echo.
cd /d "%~dp0\src-tauri"
cargo tauri build

echo.
echo ==========================================
echo   Build completata!
echo ==========================================
echo.
echo Eseguibile:  %~dp0\src-tauri\target\release\AI Data Analyst.exe
echo Installer:   %~dp0\src-tauri\target\release\bundle\msi\
echo.
pause

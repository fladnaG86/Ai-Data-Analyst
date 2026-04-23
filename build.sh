#!/bin/bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$PROJECT_DIR"

echo "=========================================="
echo "  AI Data Analyst - Build Automatico"
echo "=========================================="
echo ""

# ── Controlla Rust ─────────────────────────
if ! command -v rustc &> /dev/null; then
    echo "❌ Rust non trovato."
    echo "   Installalo da: https://rustup.rs"
    echo "   Su macOS/Linux: curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    exit 1
fi
echo "✓ Rust trovato: $(rustc --version)"

if ! command -v cargo &> /dev/null; then
    echo "❌ Cargo non trovato. Riavvia il terminale dopo l'installazione di Rust."
    exit 1
fi

# ── Controlla Tauri CLI ────────────────────
if ! cargo tauri --version &> /dev/null; then
    echo "⏳ Tauri CLI non trovata. Installo..."
    cargo install tauri-cli
    echo "✓ Tauri CLI installata"
else
    echo "✓ Tauri CLI: $(cargo tauri --version)"
fi

# ── Build ──────────────────────────────────
echo ""
echo "🚀 Avvio build in modalita' rilascio..."
echo ""
cd src-tauri
cargo tauri build

echo ""
echo "=========================================="
echo "  ✅ Build completata!"
echo "=========================================="
echo ""

EXE_NAME="AI Data Analyst"
if [[ "$OSTYPE" == "darwin"* ]]; then
    EXE_NAME="AI Data Analyst.app"
    BUNDLE_DIR="$PROJECT_DIR/src-tauri/target/release/bundle/macos"
else
    BUNDLE_DIR="$PROJECT_DIR/src-tauri/target/release/bundle/deb"
fi

EXE_PATH="$PROJECT_DIR/src-tauri/target/release/$EXE_NAME"
if [ -d "$EXE_PATH" ] || [ -f "$EXE_PATH" ]; then
    echo "📦 Eseguibile: $EXE_PATH"
else
    echo "⚠️  Eseguibile non trovato al percorso atteso."
fi

if [ -d "$BUNDLE_DIR" ]; then
    echo "📦 Bundle:      $BUNDLE_DIR"
fi

echo ""
echo "📌 Nota: per buildare per WINDOWS serve un PC Windows"
echo "   oppure usa il workflow GitHub Actions incluso."

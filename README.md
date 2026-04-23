# AI Data Analyst Local + Cloud

> **Analyze your CSV, Excel & JSON files with AI — 100% offline or local/cloud LLM.**
> Your data never leaves your computer.

---

## 🇬🇧 English

AI Data Analyst is a privacy-first desktop app for data exploration powered by local AI (LM Studio, Ollama) and cloud models. Ask questions in natural language, get instant tables, charts and JavaScript code — all executed in a secure sandbox.

### ✨ Features
- **Multi-backend**: LM Studio + Ollama (local & cloud models)
- **File support**: CSV, Excel (.xlsx/.xls), JSON, TSV, JSONL
- **Auto charts**: Bar, line, pie, doughnut with multi-column selector
- **Secure sandbox**: AI-generated JS runs in isolated Web Worker with timeout
- **Session history**: Auto-saved conversations with full restore
- **Export**: CSV, Excel, HTML chat export, print to PDF
- **Dark / light theme** with reduced-motion support
- **100% local**: No internet required after loading

### 🚀 Quick Start

#### Option 1 — Pre-built installer
Download the latest `.msi` (Windows) or `.dmg` (macOS) from the [Releases](../../releases) page.

#### Option 2 — Build from source
```bash
# 1. Install Rust
https://rustup.rs

# 2. Clone & build
git clone https://github.com/YOUR-USERNAME/ai-data-analyst.git
cd ai-data-analyst
./build.sh          # macOS / Linux
# or
.\build.ps1         # Windows PowerShell
```

The executable will be in `src-tauri/target/release/`.

### 🔧 Requirements
- [Rust](https://rustup.rs)
- [Tauri CLI](https://tauri.app) (`cargo install tauri-cli`)
- Windows: [WebView2](https://developer.microsoft.com/microsoft-edge/webview2/)
- AI backend: [LM Studio](https://lmstudio.ai) or [Ollama](https://ollama.com)

### 📂 Project Structure
```
ai-data-analyst/
├── src/                      # Frontend assets (HTML, JS, libs)
│   ├── index.html            # Main app
│   ├── papaparse.min.js
│   ├── xlsx.full.min.js
│   └── chart.umd.min.js
├── src-tauri/                # Tauri / Rust configuration
│   ├── tauri.conf.json       # CSP, window, build settings
│   ├── Cargo.toml
│   └── src/main.rs
├── build.sh                  # Build script (macOS/Linux)
├── build.bat / build.ps1     # Build script (Windows)
└── .github/workflows/        # CI/CD — auto-build on push
```

### 🛡️ Security
- Web Worker sandbox isolates AI-generated code
- Blacklist for dangerous APIs (`fetch`, `eval`, `document`, etc.)
- HTML sanitization for AI output (anti-XSS)
- API key stored in sessionStorage, not localStorage

### 📜 License
Unlimited License — see [gumroad.com](https://gumroad.com) for details.

---

## 🇮🇹 Italiano

AI Data Analyst è un'app desktop per l'esplorazione dei dati tramite intelligenza artificiale locale (LM Studio, Ollama) e modelli cloud. Fai domande in italiano, ottieni tabelle, grafici e codice JavaScript — tutto eseguito in un sandbox sicuro.

### ✨ Funzionalità
- **Multi-backend**: LM Studio + Ollama (modelli locali e cloud)
- **File supportati**: CSV, Excel (.xlsx/.xls), JSON, TSV, JSONL
- **Grafici automatici**: Barre, linee, torta, ciambella con selettore multi-colonna
- **Sandbox sicuro**: il codice JS generato dall'AI gira in un Web Worker isolato con timeout
- **Cronologia sessioni**: conversazioni salvate automaticamente, ripristino completo
- **Esportazione**: CSV, Excel, chat in HTML, stampa in PDF
- **Tema chiaro/scuro** con supporto per animazioni ridotte
- **100% locale**: nessuna connessione internet necessaria dopo il caricamento

### 🚀 Avvio rapido

#### Opzione 1 — Installer precompilato
Scarica l'ultimo `.msi` (Windows) o `.dmg` (macOS) dalla pagina [Releases](../../releases).

#### Opzione 2 — Compila dai sorgenti
```bash
# 1. Installa Rust
https://rustup.rs

# 2. Clona e compila
git clone https://github.com/YOUR-USERNAME/ai-data-analyst.git
cd ai-data-analyst
./build.sh          # macOS / Linux
# oppure
.\build.ps1         # Windows PowerShell
```

L'eseguibile sarà in `src-tauri/target/release/`.

### 🔧 Requisiti
- [Rust](https://rustup.rs)
- [Tauri CLI](https://tauri.app) (`cargo install tauri-cli`)
- Windows: [WebView2](https://developer.microsoft.com/microsoft-edge/webview2/)
- Backend AI: [LM Studio](https://lmstudio.ai) o [Ollama](https://ollama.com)

### 📂 Struttura progetto
```
ai-data-analyst/
├── src/                      # Asset frontend (HTML, JS, librerie)
│   ├── index.html            # App principale
│   ├── papaparse.min.js
│   ├── xlsx.full.min.js
│   └── chart.umd.min.js
├── src-tauri/                # Configurazione Tauri / Rust
│   ├── tauri.conf.json       # CSP, finestra, build
│   ├── Cargo.toml
│   └── src/main.rs
├── build.sh                  # Script build (macOS/Linux)
├── build.bat / build.ps1     # Script build (Windows)
└── .github/workflows/        # CI/CD — build automatica su push
```

### 🛡️ Sicurezza
- Sandbox Web Worker che isola il codice generato dall'AI
- Blacklist per API pericolose (`fetch`, `eval`, `document`, ecc.)
- Sanitizzazione HTML dell'output AI (anti-XSS)
- API key salvata in sessionStorage, non in localStorage

### 📜 Licenza
Licenza Unlimited — vedi [gumroad.com](https://gumroad.com) per i dettagli.

---

**Built with ❤️ by Maurizio Lan**

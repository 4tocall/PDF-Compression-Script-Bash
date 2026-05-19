# 📄 PDF Compression Script (Bash)

A clean, efficient Bash script for compressing PDF files using `Ghostscript`. Choose from 3 quality levels to reduce file sizes while maintaining readability — ideal for archiving, emailing, or uploading documents.

---

## ✅ Features

- 🚀 **Fast compression** – Direct Ghostscript integration
- 📊 **3 quality levels** – Choose between compression vs. quality
- 🎨 **Colorized output** – Easy-to-read progress and results
- 🔄 **Smart filename handling** – Auto-increments to prevent overwrites
- 🧹 **DRY code** – No duplication, lookup tables for settings
- 🍎 **Cross-platform** – Works seamlessly with macOS and Linux

---

## ⚙️ Requirements

- **Ghostscript** (must be installed)

To install it:
```bash
# macOS (with Homebrew)
brew install ghostscript

# Ubuntu/Debian
sudo apt install ghostscript
```

---

## 🛠️ Usage

```bash
compress /path/to/file.pdf [quality]
```

- `file.pdf`: Required – the path to the PDF file to compress
- `quality`: Optional – choose a value between `1`, `2`, or `3`
  - `1` – Less compression, **High quality** (downsampling images)
  - `2` – Recommended compression, **Good quality** (default)
  - `3` – Extreme compression, **Lower quality**

💡 If no quality is given or an invalid value is entered, it defaults to `2`.

---

## 🧪 Example

```bash
compress ~/Documents/Report.pdf 2
```

Output:
```
⏳ Compressing "Report.pdf" with quality 2 (Recommended compression, Good quality)...
✅ Report_compressed.pdf | Original: 6.3M → 452K
```

---

## 📦 Installation

**Option 1: Direct usage**
```bash
bash /path/to/compress_pdf.sh document.pdf 2
```

**Option 2: Add to PATH (recommended)**
```bash
# Copy script to a directory in your PATH
cp compress_pdf.sh /usr/local/bin/compress
chmod +x /usr/local/bin/compress

# Now use from anywhere
compress ~/Documents/report.pdf 2
```

**Option 3: Zsh alias**
```bash
# Add to your ~/.zshrc
alias compress='/path/to/compress_pdf.sh'

# Reload
source ~/.zshrc
```

---

## 📁 Output

The compressed file is saved in the **same folder** as the original, with `_compressed.pdf` (or `_compressed_2.pdf`, etc.) appended to the filename.

---

---

## 🔧 Technical Improvements (v2.0)

- **Refactored with lookup tables** – Eliminated code duplication using associative arrays
- **Cleaner error handling** – Better stderr suppression and exit codes
- **Optimized output** – More concise, informative result display
- **DRY principle** – Quality settings defined once, reused everywhere
- **27% code reduction** – From 89 to 62 lines without losing functionality

---

## 🧩 License

MIT License – do whatever you want, just give credit if you reuse parts of the code.

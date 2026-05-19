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
⏳ Starting compression of "Report.pdf" with quality setting: 2 (Recommended compression, Good quality)...
✅ Compressed file: Report_compressed.pdf | Original size: 6.3M | Compressed size: 452K
```

---

## 💡 Zsh Alias (Optional)

You can create an alias to use `compress` from anywhere in your terminal:

1. Open your `.zshrc`:
```bash
nano ~/.zshrc
```

2. Add the following line (update the path if needed):
```bash
alias compress="/full/path/to/your/script.sh"
```

For example:
```bash
alias compress="/Users/yourname/scripts/pdf_compress.sh"
```

3. Save and reload your terminal:
```bash
source ~/.zshrc
```

Then just run:
```bash
compress myfile.pdf 2
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

# ⚡ PowerShell Ultimate Cheat Sheet

<div align="center">

![PowerShell](https://img.shields.io/badge/PowerShell-7.4%2B-blue?style=for-the-badge&logo=powershell&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-informational?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![HTML](https://img.shields.io/badge/Format-HTML-orange?style=for-the-badge&logo=html5&logoColor=white)

**A beautifully designed, single-file reference covering everything from your first cmdlet to advanced scripting.**  
Beginner-friendly · Syntax-highlighted · No frameworks, no dependencies.

[View Cheat Sheet →](./powershell-cheatsheet.html)

</div>

---

## 📸 Preview

> Dark terminal aesthetic · Full syntax highlighting · Sticky navigation · Responsive layout

The cheat sheet is a single self-contained `.html` file — just open it in any browser.

---

## 📚 What's Inside

The sheet is organized into **17 sections**, color-coded by difficulty:

| # | Section | Level |
|---|---------|-------|
| 1 | 🔵 Basics & Help System | Beginner |
| 2 | 🟦 Variables & Data Types | Beginner |
| 3 | 🟡 Operators | Beginner |
| 4 | 🟢 Strings | Beginner |
| 5 | 🟠 Arrays & Hashtables | Beginner |
| 6 | 🟣 Control Flow (if/switch/loops) | Beginner |
| 7 | 🩷 Functions & Parameters | Intermediate |
| 8 | 🔷 Pipeline Mastery | Intermediate |
| 9 | 📁 Filesystem & I/O | Intermediate |
| 10 | ⚙️ Processes & Services | Intermediate |
| 11 | 🔍 Regular Expressions | Intermediate |
| 12 | 🚨 Error Handling | Intermediate |
| 13 | 🔶 Classes & OOP | Advanced |
| 14 | 📦 Modules & Packages | Intermediate |
| 15 | ⚡ Jobs & Parallelism | Advanced |
| 16 | 🌐 Remoting & REST APIs | Advanced |
| 17 | ⭐ Pro Tips & One-Liners | Advanced |

---

## 🚀 Usage

**Option 1 — Open directly**
```
# Clone and open
git clone https://github.com/your-username/powershell-cheatsheet
open powershell-cheatsheet.html       # macOS
start powershell-cheatsheet.html      # Windows
xdg-open powershell-cheatsheet.html   # Linux
```

**Option 2 — Download only the file**

Click `powershell-cheatsheet.html` → **Raw** → Save As.

No build step. No internet required after download. No dependencies.

---

## ✨ Features

- **Single file** — everything self-contained, works offline
- **Syntax highlighting** — keywords, variables, strings, comments, flags all color-coded
- **Sticky nav bar** — jump to any section instantly
- **Beginner-friendly** — every block has a short, plain-English description
- **PS 7.x focused** — includes modern features like `-Parallel`, `??=`, `**`, ternary operators
- **Cross-platform** — content applies to Windows, Linux, and macOS
- **Responsive** — works on smaller screens too

---

## 🗂 Repo Structure

```
📦 powershell-cheatsheet
 ┗ 📄 powershell-cheatsheet.html   ← the entire cheat sheet
 ┗ 📄 README.md
```

---

## 🛠 Topics Covered (Highlights)

```powershell
# A taste of what's inside...

# PS7 Parallel processing
1..10 | ForEach-Object -Parallel { "Processing $_" } -ThrottleLimit 5

# Ternary operator
$label = $age -ge 18 ? "adult" : "minor"

# Null coalescing
$value = $config ?? "default"

# Advanced function parameters
[Parameter(Mandatory)][ValidateSet("dev","staging","prod")][string]$Env

# Background jobs
$job = Start-Job { Start-Sleep 3; "Done!" }
Receive-Job $job
```

---

## 📋 Requirements

| Requirement | Version |
|-------------|---------|
| PowerShell  | 7.0+ recommended (5.1 compatible for most sections) |
| Browser     | Any modern browser to view the HTML file |

---

## 🤝 Contributing

Spotted a mistake? Have a useful snippet to add?

1. Fork the repo
2. Edit `powershell-cheatsheet.html`
3. Open a pull request with a clear description

All contributions welcome — corrections, additions, or style improvements.

---

## 📄 License

MIT — free to use, share, and modify. Attribution appreciated but not required.

---

<div align="center">
  <sub>Made with ☕ and too many pipeline operators.</sub>
</div>
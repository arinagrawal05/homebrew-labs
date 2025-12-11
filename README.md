# 🧪 Arin’s Homebrew Labs

### A collection of lightweight, developer-friendly CLI tools for macOS

This repository is the official **Homebrew Tap** for tools created by **Arin Agrawal**.
All formulae in this tap follow these principles:

* 🛡 **Safe by default**
* ⚡ **Fast and lightweight**
* 🧹 **Useful for developers & power users**
* 🔧 **Simple to install and upgrade**
* 🍺 **Fully compatible with Homebrew ecosystem**

---

## 📦 Available Formulae

### **🧼 macfresh**

Ultra-safe macOS cleanup utility that removes junk files without touching application settings, browser data, development environments, or Docker.

Install:

```bash
brew install arinagrawal05/labs/macfresh
```

Run:

```bash
macfresh
```

---

## 🚀 How to Use This Tap

You can install tools directly:

```bash
brew install arinagrawal05/labs/<formula>
```

Or tap manually (optional):

```bash
brew tap arinagrawal05/labs
```

Then:

```bash
brew install <formula>
```

---

## 📁 Repository Structure

```
homebrew-labs/
└── Formula/
      └── macfresh.rb
```

All new CLI tools will be added to the `Formula` directory.

---

## 🧪 Testing Formula Locally

To test a formula before publishing changes:

```bash
brew reinstall --build-from-source Formula/macfresh.rb
```

Or install from a local file:

```bash
brew install --build-from-source macfresh.rb
```

---

## 🚀 Adding a New Formula

If you want to publish a new CLI tool in this tap:

1. Create a separate GitHub repo for the tool
2. Publish a GitHub Release with the compiled/bundled file
3. Add a formula file to:

```
Formula/<name>.rb
```

4. Include:

   * description
   * homepage
   * url to the release asset
   * version
   * sha256
   * install block

5. Commit and push the formula

Users can now install it via:

```bash
brew install arinagrawal05/labs/<name>
```

---

## ⚙️ Automation (Optional)

This tap supports automated updates via GitHub Actions:

* Auto-generate SHA256
* Auto-update formula
* Auto-publish new versions
* Auto-commit updates to this tap

(Contact the maintainer if you want to enable this.)

---

## 🧑‍💻 Maintainer

**Arin Agrawal**

* Twitter: [https://x.com/ArinBuilds](https://x.com/ArinBuilds)
* GitHub: [https://github.com/arinagrawal05](https://github.com/arinagrawal05)

---

## 📄 License

MIT License

<h1 align="center">
  Scripts-chan
</h1>

<p align="center">
   <a href="#-features">Features</a> • 
   <a href="#-structure">Structure</a> • 
   <a href="#-modules">Modules</a> • 
   <a href="#%EF%B8%8F-installation">Installation</a> • 
   <a href="#-usage">Usage</a> • 
   <a href="#-license">License</a> 
</p>

## 🚀 Features

- Modular Arch Linux installer
- Interactive menu-driven setup
- Hardware auto-detection
- Multiple desktop support (Hyprland, Niri, Plasma)
- Unified beautiful shell style
- Auto theme switching based on wallpaper (credit: shorinkiwata)

## 📁 Structure

```
Scripts-chan/
├── configuration.sh          # Main entry point (interactive menu)
├── flake.sh                  # Flake metadata
├── hardware-configuration.sh # Hardware detection & driver install
├── home/
│   ├── ash.sh                # User applications setup
│   ├── rebootloader.sh       # Bootloader reinstall
│   └── shorin-niri-setup.sh  # Niri full environment setup
└── modules/
    ├── bootloader.sh         # GRUB/UEFI bootloader config
    ├── desktop-hyprland.sh   # Hyprland desktop install
    ├── desktop-niri.sh       # Niri desktop install
    ├── desktop-plasma.sh     # KDE Plasma desktop install
    └── system.sh             # System base setup
```

## 📦 Modules

| Module                      | Used For                              |
| --------------------------- | ------------------------------------- |
| `hardware-configuration.sh` | Hardware detection & driver install   |
| `system.sh`                 | System base packages & locale         |
| `bootloader.sh`             | GRUB/UEFI bootloader setup            |
| `desktop-hyprland.sh`       | Hyprland window manager               |
| `desktop-niri.sh`           | Niri Wayland compositor               |
| `desktop-plasma.sh`         | KDE Plasma desktop environment        |
| `ash.sh`                    | User apps & dotfiles                  |
| `shorin-niri-setup.sh`      | Full Niri environment (configs, apps) |
| `rebootloader.sh`           | Bootloader reinstall helper           |

## 🛠️ Installation

```bash
git clone https://github.com/bt-ASH/Scripts-chan.git
cd Scripts-chan
chmod +x *.sh modules/*.sh home/*.sh
./configuration.sh
```

## 🎯 Usage

Run the main entry point:

```bash
./configuration.sh
```

Select a module from the interactive menu, or run individual modules directly:

```bash
./modules/system.sh
./modules/desktop-niri.sh
```

## ⚠️ Notes

- Tested on Arch Linux only
- Scripts content is in English (avoids TTY encoding issues)
- Original scripts preserved at `/home/ash/archlinux/`
- Auto theme switching feature inspired by shorinkiwata (Bilibili)

## 📄 License

[GPL-3.0](LICENSE)

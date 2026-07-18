#!/usr/bin/env bash
# ── Hyprland Desktop Setup ──────────────────────────────

set -euo pipefail

CRED='\033[0;31m'
CGRN='\033[0;32m'
CDEF='\033[0m'

hyprland_pkgs=(
    # ── Sound ───────────────────────────────────────────
    alsa-utils alsa-firmware
    pipewire pipewire-pulse pipewire-alsa
    pavucontrol cava gvfs-smb

    # ── Bluetooth ───────────────────────────────────────
    bluez bluez-utils

    # ── Hardware ────────────────────────────────────────
    usbutils
    mesa mesa-utils vulkan-intel
    lib32-mesa lib32-vulkan-intel
    intel-gpu-tools intel-ucode

    # ── Fonts & Icons ───────────────────────────────────
    noto-fonts-cjk ttf-dejavu ttf-liberation
    ttf-nerd-fonts-symbols noto-fonts-emoji
    meowsans-ttf ttf-font-awesome ttf-jetbrains-mono-nerd

    # ── Input Method ────────────────────────────────────
    fcitx5-im fcitx5-rime
    fcitx5 fcitx5-gtk fcitx5-qt
    fcitx5-configtool fcitx5-bamboo

    # ── Shutdown / Lock ─────────────────────────────────
    wlogout

    # ── Portal ──────────────────────────────────────────
    xdg-desktop-portal
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-wlr xdg-desktop-portal-gtk

    # ── Qt / GTK ────────────────────────────────────────
    qt5ct qt6ct qt5-wayland qt6-wayland

    # ── Image ───────────────────────────────────────────
    libvips

    # ── Window Manager ──────────────────────────────────
    hyprland waybar rofi swaync swww
    kitty brightnessctl swayidle nemo

    # ── Apps ────────────────────────────────────────────
    bat fastfetch viu jq mpv starship
    blueman dust gnome-characters
)

echo -e "${CGRN}>> Installing Hyprland packages...${CDEF}"
echo "  ───────────────────────────────────────────────────"

if paru -S --noconfirm "${hyprland_pkgs[@]}"; then
    echo -e "${CGRN}>> Done.${CDEF}"
else
    echo -e "${CRED}>> Failed to install Hyprland packages.${CDEF}"
    exit 1
fi

echo ""
echo -e "${CGRN}>> Building bat cache...${CDEF}"
bat cache --build

exit 0

#!/usr/bin/env bash
# ── Niri Desktop Setup ──────────────────────────────────

set -euo pipefail

CRED='\033[0;31m'
CGRN='\033[0;32m'
CDEF='\033[0m'

# ── Pacman packages ─────────────────────────────────────
pacman_pkgs=(
    # ── NVIDIA ──────────────────────────────────────────
    nvidia-prime

    # ── Intel / Vulkan ──────────────────────────────────
    mesa mesa-utils vulkan-intel
    lib32-mesa lib32-vulkan-intel lib32-vulkan-radeon
    intel-gpu-tools intel-ucode
    vulkan-tools
    intel-media-sdk libva-utils
    gstreamer gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly

    # ── Sound ───────────────────────────────────────────
    alsa-utils sof-firmware alsa-ucm-conf alsa-firmware
    pipewire pipewire-pulse pipewire-alsa pipewire-jack
    pavucontrol cava wireplumber

    # ── Window Manager ──────────────────────────────────
    niri niri-float-sticky fuzzel mako
    swayidle hyprlock swaylock-effects
    xdg-desktop-portal xdg-desktop-portal-gnome xorg-xwayland
    awww hyprpicker
    waybar kitty

    # ── Wayland ─────────────────────────────────────────
    xwayland-satellite

    # ── System ──────────────────────────────────────────
    git wget btrfs-progs
    nvtop htop wiremix s-tui
    tree brightnessctl
    bluez bluez-utils blueman

    # ── Apps ────────────────────────────────────────────
    fastfetch jq
    cava unzip unrar tmux yazi util-linux cmatrix
    neovim flatpak gnome-software
    kdenlive mono
    docker docker-compose
    navicat-premium-lite-zh-cn

    # ── Desktop Integration ─────────────────────────────
    power-profiles-daemon
    ffmpegthumbnailer gvfs-smb
    nautilus-open-any-terminal file-roller
    gst-plugins-base gst-plugins-good gst-libav
    wl-clipboard satty
    obs-studio

    # ── Display Manager ─────────────────────────────────
    sddm

    # ── Input Method ────────────────────────────────────
    fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool
    fcitx5-bamboo fcitx5-rime rime-ice-pinyin

    # ── Fonts ───────────────────────────────────────────
    ttf-maplemono ttf-maplemono-nf-unhinted
    adwaita-fonts noto-fonts-cjk ttf-dejavu ttf-liberation
    ttf-nerd-fonts-symbols noto-fonts-emoji
    ttf-font-awesome ttf-jetbrains-mono-nerd kvantum-qt5

    # ── Themes ──────────────────────────────────────────
    papirus-icon-theme nwg-look

    # ── Misc ────────────────────────────────────────────
    jdk21-openjdk pyenv iputils
)

# ── AUR packages ────────────────────────────────────────
aur_pkgs=(
    # ── NVIDIA ──────────────────────────────────────────
    lib32-nvidia-580xx-utils lib32-opencl-nvidia-580xx
    nvidia-580xx-dkms nvidia-580xx-utils nvidia-580xx-settings

    # ── Wayland ─────────────────────────────────────────
    waypaper blueberry

    # ── System ──────────────────────────────────────────
    tty-clock uv
    clipse-wayland-bin scrcpy

    # ── Themes ──────────────────────────────────────────
    catppuccin-fcitx5 catppuccin-gtk-theme-mocha

    # ── Fonts ───────────────────────────────────────────
    ttf-maplemono-nf-cn-unhinted meowsans-ttf

    # ── Apps ────────────────────────────────────────────
    vmware-workstation firefox burpsuite
)

# ── Flatpak packages ────────────────────────────────────
flatpak_pkgs=(
    com.baidu.NetDisk
    org.localsend.localsend_app
    com.google.Chrome
)

# ── Install ─────────────────────────────────────────────
echo -e "${CGRN}>> Installing pacman packages...${CDEF}"
echo "  ───────────────────────────────────────────────────"
sudo pacman -S --noconfirm "${pacman_pkgs[@]}"

echo ""
echo -e "${CGRN}>> Installing AUR packages...${CDEF}"
echo "  ───────────────────────────────────────────────────"
paru -S --noconfirm "${aur_pkgs[@]}"

echo ""
echo -e "${CGRN}>> Configuring flatpak mirror & installing...${CDEF}"
echo "  ───────────────────────────────────────────────────"
sudo flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
flatpak install -y "${flatpak_pkgs[@]}"

# ── Services ────────────────────────────────────────────
echo ""
echo -e "${CGRN}>> Enabling services...${CDEF}"
echo "  ───────────────────────────────────────────────────"
sudo systemctl enable --now power-profiles-daemon.service
systemctl --user enable --now pipewire pipewire-pulse wireplumber
sudo systemctl enable --now docker
sudo usermod -aG docker "$USER"
sudo systemctl enable --now vmware-networks.service
sudo systemctl enable --now vmware-networks-configuration.service
sudo modprobe vmmon vmnet

echo ""
echo -e "${CGRN}>> Done.${CDEF}"

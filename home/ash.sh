#!/usr/bin/env bash
# ── User Applications ───────────────────────────────────

set -euo pipefail

CRED='\033[0;31m'
CGRN='\033[0;32m'
CDEF='\033[0m'

# ── Pacman packages ─────────────────────────────────────
pacman_pkgs=(
    firefox firefox-dark-reader firefox-tridactyl firefox-ublock-origin
    musicfox
    steam
    qemu-full virt-manager swtpm
    obsidian
)

# ── Flatpak packages ────────────────────────────────────
flatpak_pkgs=(
    com.pot_app.pot
    com.qq.QQ
    com.tencent.WeChat
    com.wps.Office
)

echo -e "${CGRN}>> Installing pacman packages...${CDEF}"
echo "  ───────────────────────────────────────────────────"
sudo pacman -S --noconfirm "${pacman_pkgs[@]}"

echo ""
echo -e "${CGRN}>> Installing flatpak packages...${CDEF}"
echo "  ───────────────────────────────────────────────────"
flatpak install -y "${flatpak_pkgs[@]}"

echo ""
echo -e "${CGRN}>> Done.${CDEF}"
exit 0

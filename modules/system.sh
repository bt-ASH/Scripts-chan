#!/usr/bin/env bash
# ── System Base Packages ────────────────────────────────

set -euo pipefail

CRED='\033[0;31m'
CGRN='\033[0;32m'
CDEF='\033[0m'

system_pkgs=(
    rsync base-devel ntfs-3g paru
    btrfs-progs traceroute iputils
    udisks2 borg networkmanager network-manager-applet
    neovim sudo
    intel-ucode
    grub efibootmgr
    clangd clang
)

echo -e "${CGRN}>> Installing system base packages...${CDEF}"
echo "  ───────────────────────────────────────────────────"

if sudo pacman -S --noconfirm "${system_pkgs[@]}"; then
    echo -e "${CGRN}>> Done.${CDEF}"
else
    echo -e "${CRED}>> Failed to install system packages.${CDEF}"
    exit 1
fi
exit 0

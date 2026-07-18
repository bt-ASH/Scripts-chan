#!/usr/bin/env bash
# ── GRUB Bootloader Setup ───────────────────────────────

set -euo pipefail

CRED='\033[0;31m'
CGRN='\033[0;32m'
CDEF='\033[0m'

# ── Install GRUB if missing ─────────────────────────────
if ! command -v grub-install &>/dev/null; then
    echo -e "${CGRN}>> Installing grub & efibootmgr...${CDEF}"
    echo "  ───────────────────────────────────────────────────"
    sudo pacman -S --noconfirm grub efibootmgr
fi

# ── Install GRUB ────────────────────────────────────────
echo -e "${CGRN}>> Installing GRUB to EFI...${CDEF}"
echo "  ───────────────────────────────────────────────────"
sudo grub-install \
    --target=x86_64-efi \
    --efi-directory=/boot \
    --bootloader-id=Archlinux

# ── Enable os-prober ────────────────────────────────────
echo -e "${CGRN}>> Enabling os-prober...${CDEF}"
echo "  ───────────────────────────────────────────────────"
sudo pacman -S --noconfirm os-prober
sudo sed -i 's/#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub

# ── Generate config ─────────────────────────────────────
echo -e "${CGRN}>> Generating grub config...${CDEF}"
echo "  ───────────────────────────────────────────────────"
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo -e "${CGRN}>> Done.${CDEF}"

#!/usr/bin/env bash
# ── Reinstall GRUB Bootloader ───────────────────────────

set -euo pipefail

CRED='\033[0;31m'
CGRN='\033[0;32m'
CDEF='\033[0m'

echo -e "${CGRN}>> Reinstalling GRUB...${CDEF}"
echo "  ───────────────────────────────────────────────────"

sudo grub-install \
    --target=x86_64-efi \
    --efi-directory=/boot \
    --bootloader-id=Archlinux

echo -e "${CGRN}>> Generating grub config...${CDEF}"
sudo grub-mkconfig -o /boot/grub/grub.cfg

echo -e "${CGRN}>> Done.${CDEF}"

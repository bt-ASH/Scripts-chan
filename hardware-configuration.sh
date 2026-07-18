#!/usr/bin/env bash
# ── Hardware Configuration & Base Packages ──────────────

set -euo pipefail

CRED='\033[0;31m'
CGRN='\033[0;32m'
CDEF='\033[0m'

linux_pkg=(
    bash linux-lts-headers linux-lts linux-firmware
)

echo -e "${CGRN}>> Installing base & linux kernel packages...${CDEF}"
echo "  ${linux_pkg[*]}"
echo "  ───────────────────────────────────────────────────"

if sudo pacstrap -K /mnt "${linux_pkg[@]}"; then
    echo -e "${CGRN}>> Done.${CDEF}"
else
    echo -e "${CRED}>> Failed to install base packages.${CDEF}"
    exit 1
fi

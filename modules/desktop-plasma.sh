#!/usr/bin/env bash
# ── Plasma Desktop Setup ────────────────────────────────

set -euo pipefail

CRED='\033[0;31m'
CGRN='\033[0;32m'
CDEF='\033[0m'

plasma_pkgs=(
    plasma-desktop kscreen konsole dolphin
    plasma-nm plasma-pa power-profiles-daemon
    xdg-desktop-portal-kde
)

echo -e "${CGRN}>> Installing Plasma packages...${CDEF}"
echo "  ───────────────────────────────────────────────────"

if paru -S --noconfirm "${plasma_pkgs[@]}"; then
    echo -e "${CGRN}>> Done.${CDEF}"
else
    echo -e "${CRED}>> Failed to install Plasma packages.${CDEF}"
    exit 1
fi

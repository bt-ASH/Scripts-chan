#!/usr/bin/env bash
# ── Shorin Niri Full Setup ──────────────────────────────

set -euo pipefail

CRED='\033[0;31m'
CGRN='\033[0;32m'
CYLW='\033[0;33m'
CDEF='\033[0m'

# ── Ensure sudo ─────────────────────────────────────────
sudo -v || { echo -e "${CRED}>> sudo failed${CDEF}"; exit 1; }
(sudo -n true; while kill -0 "$$" 2>/dev/null; do sudo -n true >/dev/null 2>&1; sleep 60; done) 2>/dev/null &

# ── Step 1: Remove conflicting fuzzel ───────────────────
echo -e "${CGRN}>> Step 1: Removing conflicting fuzzel...${CDEF}"
echo "  ───────────────────────────────────────────────────"
if pacman -Q fuzzel 2>/dev/null; then
    echo -e "${CYLW}  fuzzel detected, removing...${CDEF}"
    sudo pacman -Rdd --noconfirm fuzzel 2>&1 && echo -e "${CGRN}  fuzzel removed${CDEF}" || echo -e "${CYLW}  fuzzel removal failed, continuing...${CDEF}"
else
    echo -e "${CGRN}  fuzzel not installed, skipping${CDEF}"
fi

# ── Step 2: Install shorin-niri-git ─────────────────────
echo -e "${CGRN}>> Step 2: Installing shorin-niri-git...${CDEF}"
echo "  ───────────────────────────────────────────────────"
paru -S --noconfirm shorin-niri-git 2>&1
if pacman -Q shorin-niri-git 2>/dev/null; then
    echo -e "${CGRN}  shorin-niri-git installed successfully${CDEF}"
else
    echo -e "${CRED}  shorin-niri-git installation failed${CDEF}"
    exit 1
fi

# ── Step 3: Run shorinniri init ─────────────────────────
echo -e "${CGRN}>> Step 3: Running shorinniri init...${CDEF}"
echo "  ───────────────────────────────────────────────────"
echo -e "  ${CYLW}This will install dependencies and deploy all config files${CDEF}"
echo -e "  ${CYLW}Existing configs will be backed up to ~/.cache/shorin-niri-backup/${CDEF}"
shorinniri init 2>&1

# ── Done ────────────────────────────────────────────────
echo ""
echo -e "${CGRN}>> Setup complete!${CDEF}"
echo "  ───────────────────────────────────────────────────"
echo -e "  ${CYLW}1.${CDEF} Restart niri session or reboot"
echo -e "     (or run: niri-session)"
echo ""
echo -e "  ${CYLW}2.${CDEF} Test wallpaper color generation:"
echo -e "     Super+F10 for random wallpaper + color"
echo -e "     matugen-update    update colors"
echo -e "     matugen-select-type   pick style"
echo ""
echo -e "  ${CYLW}3.${CDEF} To rollback:"
echo -e "     Backup: ~/.cache/shorin-niri-backup/"
echo -e "     Remove: shorinniri remove"

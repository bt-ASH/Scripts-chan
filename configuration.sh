#!/usr/bin/env bash
# ╔═══════════════════════════════════════════════════════╗
# ║           Scripts-chan Installer v1.0                 ║
# ║           Modular Arch Linux Setup                    ║
# ╚═══════════════════════════════════════════════════════╝

set -euo pipefail

# ── Colors ──────────────────────────────────────────────
CRED='\033[0;31m'
CGRN='\033[0;32m'
CYLW='\033[0;33m'
CBLD='\033[1m'
CDEF='\033[0m'

# ── Paths ───────────────────────────────────────────────
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

declare -A MODULES=(
    [1]="hardware-configuration.sh"
    [2]="modules/system.sh"
    [3]="modules/bootloader.sh"
    [4]="modules/desktop-niri.sh"
    [5]="modules/desktop-hyprland.sh"
    [6]="modules/desktop-plasma.sh"
    [7]="home/ash.sh"
    [8]="home/rebootloader.sh"
    [9]="home/shorin-niri-setup.sh"
)

# ── Menu ────────────────────────────────────────────────
show_menu() {
    clear
    echo -e "${CBLD}${CYLW}"
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║           Scripts-chan Installer v1.0                 ║"
    echo "║           Modular Arch Linux Setup                    ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo -e "${CDEF}"
    echo ""
    echo -e "  ${CBLD}Available Modules:${CDEF}"
    echo -e "  ───────────────────────────────────────────────────"
    echo -e "  ${CGRN}1)${CDEF}  hardware-configuration.sh"
    echo -e "  ${CGRN}2)${CDEF}  modules/system.sh"
    echo -e "  ${CGRN}3)${CDEF}  modules/bootloader.sh"
    echo -e "  ${CGRN}4)${CDEF}  modules/desktop-niri.sh"
    echo -e "  ${CGRN}5)${CDEF}  modules/desktop-hyprland.sh"
    echo -e "  ${CGRN}6)${CDEF}  modules/desktop-plasma.sh"
    echo -e "  ${CGRN}7)${CDEF}  home/ash.sh"
    echo -e "  ${CGRN}8)${CDEF}  home/rebootloader.sh"
    echo -e "  ${CGRN}9)${CDEF}  home/shorin-niri-setup.sh"
    echo -e "  ───────────────────────────────────────────────────"
    echo -e "  ${CRED}q)${CDEF}  Quit"
    echo ""
}

# ── Main Loop ───────────────────────────────────────────
while true; do
    show_menu
    read -rp "  Select > " choice

    case $choice in
        [1-9])
            target="${SCRIPT_DIR}/${MODULES[$choice]}"
            echo ""
            if [[ -x "$target" ]]; then
                echo -e "  ${CGRN}>> Running ${MODULES[$choice]} ...${CDEF}"
                echo "  ───────────────────────────────────────────────────"
                "$target"
            else
                echo -e "  ${CYLW}>> ${MODULES[$choice]} (not executable, running with bash)${CDEF}"
                echo "  ───────────────────────────────────────────────────"
                bash "$target"
            fi
            echo ""
            ;;
        q|Q)
            echo -e "  ${CBLD}Bye~${CDEF}"
            exit 0
            ;;
        *)
            echo -e "  ${CRED}Invalid option${CDEF}"
            sleep 1
            continue
            ;;
    esac

    echo ""
    read -rp "  Press Enter to continue..."
done

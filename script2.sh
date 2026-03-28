#!/bin/bash
# Script 2: FOSS Package Inspector
# Purpose: Check if Git is installed and display its details

PACKAGE="git"   # Package name

# --- Check if package is installed ---
# dpkg -l lists installed packages, grep searches for git
if dpkg -l | grep -q $PACKAGE; then
    echo "$PACKAGE is installed."
    
    # Show package details (version, description)
    dpkg -l | grep $PACKAGE | head -n 1
else
    echo "$PACKAGE is NOT installed."
fi

# --- Case statement for description ---
case $PACKAGE in
    git) echo "Git: distributed version control system built by Linus Torvalds" ;;
    apache2) echo "Apache: web server powering the internet" ;;
    mysql) echo "MySQL: open-source database system" ;;
    vlc) echo "VLC: open-source multimedia player" ;;
esac

# --- Show git version ---
git --version   # Displays installed Git version

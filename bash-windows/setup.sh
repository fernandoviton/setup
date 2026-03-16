#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== Bash on Windows Setup ==="

# ---- Ensure ~/bin exists ----
mkdir -p "$HOME/bin"

# ---- Install starship if missing ----
if ! command -v starship &>/dev/null && [ ! -f "$HOME/bin/starship.exe" ]; then
  echo "Installing starship to ~/bin..."
  curl -sS https://starship.rs/install.sh | sh -s -- -b "$HOME/bin" -y
else
  echo "Starship already installed."
fi

# ---- Copy .bash_profile ----
PROFILE_SRC="$SCRIPT_DIR/.bash_profile"
PROFILE_DST="$HOME/.bash_profile"

if [ -f "$PROFILE_DST" ]; then
  if cmp -s "$PROFILE_SRC" "$PROFILE_DST"; then
    echo ".bash_profile already up to date."
  else
    echo "Backing up existing .bash_profile to .bash_profile.bak"
    cp "$PROFILE_DST" "$PROFILE_DST.bak"
    cp "$PROFILE_SRC" "$PROFILE_DST"
    echo "Updated .bash_profile"
  fi
else
  cp "$PROFILE_SRC" "$PROFILE_DST"
  echo "Copied .bash_profile"
fi

# ---- Copy starship.toml ----
STARSHIP_SRC="$SCRIPT_DIR/starship.toml"
STARSHIP_DST="$HOME/.config/starship.toml"

mkdir -p "$HOME/.config"
if [ -f "$STARSHIP_DST" ]; then
  if cmp -s "$STARSHIP_SRC" "$STARSHIP_DST"; then
    echo "starship.toml already up to date."
  else
    echo "Backing up existing starship.toml to starship.toml.bak"
    cp "$STARSHIP_DST" "$STARSHIP_DST.bak"
    cp "$STARSHIP_SRC" "$STARSHIP_DST"
    echo "Updated starship.toml"
  fi
else
  cp "$STARSHIP_SRC" "$STARSHIP_DST"
  echo "Copied starship.toml"
fi

# ---- Copy .bashrc ----
BASHRC_SRC="$SCRIPT_DIR/.bashrc"
BASHRC_DST="$HOME/.bashrc"

if [ -f "$BASHRC_DST" ]; then
  if cmp -s "$BASHRC_SRC" "$BASHRC_DST"; then
    echo ".bashrc already up to date."
  else
    echo "Backing up existing .bashrc to .bashrc.bak"
    cp "$BASHRC_DST" "$BASHRC_DST.bak"
    cp "$BASHRC_SRC" "$BASHRC_DST"
    echo "Updated .bashrc"
  fi
else
  cp "$BASHRC_SRC" "$BASHRC_DST"
  echo "Copied .bashrc"
fi

echo ""
echo "Done! Restart your terminal or run: source ~/.bashrc"

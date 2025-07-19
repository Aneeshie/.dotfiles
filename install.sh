#!/bin/bash

set -e

log() {
  echo -e "\033[1;32m[INFO]\033[0m $1"
}

error() {
  echo -e "\033[1;31m[ERROR]\033[0m $1"
  exit 1
}

install_brew() {
  if ! command -v brew &> /dev/null; then
    log "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    log "Homebrew installed successfully!"
  else
    log "Homebrew already installed."
  fi
}

install_pkg() {
  local pkg=$1
  if ! brew list "$pkg" &>/dev/null; then
    log "Installing $pkg..."
    brew install "$pkg"
    log "$pkg installed."
  else
    log "$pkg already installed."
  fi
}

install_ghostty() {
  if ! command -v ghostty &> /dev/null; then
    log "Installing Ghostty..."
    brew install --no-quarantine ghostty
    log "Ghostty installed."
  else
    log "Ghostty already installed."
  fi
}

change_to_zsh() {
  if [[ "$SHELL" != */zsh ]]; then
    log "Changing shell to Zsh..."
    chsh -s "$(which zsh)"
    log "Shell changed to Zsh. Please restart your terminal session after this script finishes."
  else
    log "Shell is already Zsh."
  fi
}

run_stow() {
  if [ -d "$HOME/.dotfiles" ]; then
    cd "$HOME/.dotfiles" || error "Cannot access ~/.dotfiles"
    for dir in */; do
      stow "${dir%/}"
    done
    log "Stowed all configs from .dotfiles."
  else
    error "~/.dotfiles not found. Skipping stow."
  fi
}

main() {
  install_brew

  install_pkg git
  install_pkg stow
  install_pkg neovim
  install_ghostty
  install_pkg zsh
  install_pkg fzf
  install_pkg rust
  install_pkg go
  install_pkg python
  install_pkg gcc
  install_pkg gh

  change_to_zsh
  run_stow

  log "Installation Done, ENJOY!!!"
}

main


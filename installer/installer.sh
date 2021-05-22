#!/usr/bin/env bash

_DOTFILE_INSTLLER_PATH=$(dirname $0)

# Change working directory
cd $_DOTFILE_INSTLLER_PATH
source "shared/homebrew.env"

# Homebrew house-keeping
ohai "Updating Homebrew..."
execute "brew" "update"

# Install Applications and Tools via Homebrew
ohai "Installing applications via brew..."
brewbundle "homebrew/apps.brewfile"

ohai "Installing tools via brew..."
brewbundle "homebrew/tools.brewfile"

ohai "Installing development tools via brew..."
brewbundle "homebrew/development.brewfile"

ohai "Installing fonts via brew..."
brewbundle "homebrew/fonts.brewfile"

# Installation successful!
ohai "Installation successful!"

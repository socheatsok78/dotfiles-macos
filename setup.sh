#!/usr/bin/env bash

DOTFILE_HOME=${DOTFILE_HOME:-$HOME/.dotfile.local}
DOTFILE_REPO=${DOTFILE_REPO:-"https://github.com/socheatsok78/dotfiles-macos.git"}

# -------------------------------------------------- pre-flight
# string formatters
tty_escape() { :; }

tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_yellow="$(tty_mkbold 33)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

shell_join() {
    local arg
    printf "%s" "$1"
    shift
    for arg in "$@"; do
        printf " "
        printf "%s" "${arg// /\ }"
    done
}

chomp() {
    printf "%s" "${1/"$'\n'"/}"
}

ohai() {
    printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

warn() {
    printf "${tty_yellow}Warning${tty_reset}: %s\n" "$(chomp "$1")"
}

error(){
    printf "${tty_red}Error${tty_reset}: %s\n" "$(chomp "$1")" >>/dev/stderr
}

abort() {
  printf "%s\n" "$1"
  exit 1
}

execute() {
  if ! "$@"; then
    abort "$(printf "Failed during: %s" "$(shell_join "$@")")"
  fi
}

# Custom Functions
brewbundle () {
    if [ -n "$CI" ]; then
        execute "brew" "bundle" "--verbose" "--no-lock" "--file" $@
    else
        execute "brew" "bundle" "--no-lock"  "--file" $@
    fi
}

# -------------------------------------------------- trap
# Your trap goes here

# -------------------------------------------------- setup
echo "       __      __  _____ __         "
echo "  ____/ /___  / /_/ __(_) /__  _____"
echo " / __  / __ \/ __/ /_/ / / _ \/ ___/"
echo "/ /_/ / /_/ / /_/ __/ / /  __(__  ) "
echo "\__,_/\____/\__/_/ /_/_/\___/____/  "
echo "                                    "

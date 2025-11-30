#!/bin/bash
set -euo pipefail

# ============================================================
#  📦 DNFING PACKAGES
#  Very good stuffs.
# ============================================================

echo "▶ Install shit"
sudo dnf install -y \
    zsh \
    rcm \
    neovim \
    fzf \
    foot \
    pipx \
    trash-cli \
    python3-pip \
    vim \
    nnn \
    lsd \
    gitui \
    fd-find

echo "▶ Install development tool groups"
sudo dnf install -y @development-tools

# What?!
# @development-libraries

# Needed in most build and compile bin scripts.
# Neovim Treesitter also needs this.
echo "▶ Install C development tools and libraries group"
sudo dnf install -y @c-development

# I need this. YJIT need this.
# echo "▶ Install Rust toolchain"
# sudo dnf install -y rust cargo
#
# Do this instead as it provides the latest Rust and comes with toolchain management, and is
# the official recommended installation method over distribution packages.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# gitui on cargo need this.
# https://github.com/extrawurst/gitui/issues/961#issuecomment-997928556

echo "▶ Install Perl (needed by gitui)"
sudo dnf install -y perl

echo "▶ Install dconf-editor"
sudo dnf install -y dconf-editor

# potentially, this could be one of the ruby-build dependencies
# that doesn't get installed above.
# https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
echo "▶ Install Ruby build dependencies"
sudo dnf install -y \
    libyaml-devel \
    libffi-devel \
    readline-devel \
    zlib-devel \
    gdbm-devel \
    ncurses-devel

# asdf needs this, but I also need the Go runtime in the system anyway.
echo "▶ Install Go runtime"
sudo dnf install -y golang

# Dependencies for building foot, pgo mode.
echo "▶ Install foot build dependencies"
sudo dnf install -y \
    meson \
    cmake \
    pixman-devel \
    rust-wayland-client+default-devel.noarch \
    libxkbcommon-devel \
    fontconfig-devel

# Additional packages.
echo "▶ Install additional desktop tools"
sudo dnf install -y \
    libgnome \
    gnome-tweaks \
    git-extras

# For building deno.
echo "▶ Install protobuf compiler (for deno)"
sudo dnf install -y protobuf-compiler

# For bundling Rails locally.
echo "▶ Install PostgreSQL development headers"
sudo dnf install -y postgresql-devel

echo "▶ asdf ruby dependencies"
sudo dnf install -y autoconf gcc rust patch make bzip2 openssl-devel libyaml-devel libffi-devel readline-devel gdbm-devel ncurses-devel perl-FindBin
# For fedora => 40
sudo dnf install -y zlib-ng-compat-devel


# ============================================================
#  🐚 SETTING UP SHELL AND DOTFILES
# I don't know anything about this, these were all set up a long time ago. I don't want to touch them.
# ============================================================

echo "▶ Set zsh as default shell"
sudo chsh -s /bin/zsh "$USER"

echo "▶ Clone my fork of thoughtbot dotfiles"
if [ ! -d ~/dotfiles ]; then
    git clone https://github.com/thoughtbot/dotfiles.git ~/dotfiles
fi

echo "▶ Clone my dotfuay"
if [ ! -d ~/dotfiles-local ]; then
    git clone https://github.com/lngsx/dotfuay.git ~/dotfiles-local
fi

# Don't need this anymore, they have moved this to go package instead.
echo "▶ Install asdf"
go install github.com/asdf-vm/asdf/cmd/asdf@v0.18.0

echo "▶ Clone antidote repository"
if [ ! -d ~/.antidote ]; then
    git clone --depth 1 https://github.com/mattmc3/antidote.git ~/.antidote
fi

echo "▶ Clone Tmux Plugin Manager"
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# I don't even know why I made this !$?!#@
echo "▶ Ensure the noisy_banana directory exists"
mkdir -p ~/.config/noisy_banana

echo "▶ Ensure the noisy_banana file exists"
touch ~/.config/noisy_banana/nothing

# ============================================================
#  🔤 INSTALL FONTS
# This is the one!
# ============================================================

echo "▶ Ensuring fonts directory exists"
mkdir -p ~/.local/share/fonts

echo "▶ Download and unarchive fonts file"
if [ ! -f ~/.local/share/fonts/SauceCodeProNerdFont-Regular.ttf ]; then
    curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.tar.xz \
        | tar -xJ -C ~/.local/share/fonts

    echo "▶ Refreshing font cache"
    fc-cache -fv

    echo "✓ Fonts installed and cache updated!"
else
    echo "✓ Font already installed"
fi

# ============================================================
#  📁 ENSURING REPO
# Actually, we don't need this anymore, but I like to keep it.
# ============================================================

echo "▶ Ensure Repo directory exists"
mkdir -p ~/Repo/Active_Projects

echo "▶ Ensure Repo directory exists"
mkdir -p ~/Repo/Sandboxes

echo "▶ Copy using inline content"
echo 'Everything in this directory can be deleted.' > ~/Repo/Sandboxes/README.txt

# ============================================================
#  🎉 NEXT STEPS
# ============================================================

echo ""
echo "▶ Show human a green text they like green text 😮"
echo "Activate the dotfiles by running: env RCRC=\$HOME/dotfiles/rcrc rcup"

echo ""
echo "▶ ------------( ͡° ͜ʖ ͡°)----------------"
echo "-----------------------------------------------------"

echo ""
echo "▶ Run this"
echo "Human. Don't forget to re-login to activate the shell."

echo ""
echo "▶ ------------( ͡° ͜ʖ ͡°)----------------"
echo "🍎🍐🍊🍋🍌🍉🍇🍓🍈🍒🍑🍍🥭🥥🥝🍅🍆🥑🥦"

echo ""
echo "⚠️  After re-login, run: ./post.sh"

# I don't think this script is possible because it requires user input.
# - name: Run the script to activate the dotfiles
#   ansible.builtin.shell: 
#     cmd: env RCRC=$HOME/dotfiles/rcrc rcup

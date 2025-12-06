#!/bin/bash
set -euo pipefail

# ============================================================
#  🐍 INSTALL PYTHON PACKAGE
# ============================================================

echo "▶ Install python package"
pip install --user \
    libtmux \
    legit \
    shell-gpt \
    pynvim

# Find the way to use pip3 next time.

# ============================================================
#  📦 INSTALL NODEJS
# ============================================================

echo "▶ Add nodejs plugin to asdf"
if [ ! -d ~/.asdf/plugins/nodejs ]; then
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
fi

echo "▶ Install latest version of nodejs"
asdf install nodejs 24.3.0

echo "▶ Set global version of nodejs"
asdf set -u nodejs 24.3.0

# ============================================================
#  💎 INSTALL RUBY
# ============================================================

echo "▶ Add ruby plugin to asdf"
if [ ! -d ~/.asdf/plugins/ruby ]; then
    asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
fi

# For my current project. I will remove this later when I have migrated 
# to the new version.
# echo "▶ Install ruby 3.2.0"
# asdf install ruby 3.2.0

echo "▶ Install ruby latest"
asdf install ruby 3.4.5

echo "▶ Set global version of ruby"
asdf set -u ruby 3.4.5

# ============================================================
#  💎 INSTALL RUBY GEMS
# ============================================================

# The previous one was pointed to 7.0.8. I'm not sure which project uses this, so I will point to the latest from now on.
echo "▶ Install Rails 8.1.1"
gem install rails -v 8.1.1

echo "▶ Install solargraph"
gem install solargraph

# ============================================================
#  🦀 CARGO THE RUST PACKAGES, SMOOTH LIKE COCONUT OIL... 🥥
# ============================================================

# The rust cargo I think is the best choice for installing rust packages.
# The dnf packages freshness is... not great it almost expired. 🫠
echo "▶ Cargo the rust packages, smooth like coconut oil... 🥥"
cargo install \
    ripgrep \
    bat \
    oxker \
    supdock \
    cargo-binstall

    # Do these with dnf instead...
    # fd-find \
    # bottom \
    # gitui \
    # lsd \

# Additional packages start here...

echo "▶ Install yazi"
sudo dnf copr enable lihaohong/yazi -y
sudo dnf install yazi -y

# Install its plugins. There is a plugins file, but I am not sure about the package versioning or how it works,
# so I'll do it manually, by hand, like this.
ya pkg add yazi-rs/plugins:full-border
ya pack -a imsi32/yatline
ya pkg add kalidyasin/yazi-flavors:tokyonight-night

# ya pkg add dangooddd/kanagawa
# ya pkg add yazi-rs/plugins:piper
# End of yazi plugins.

echo "▶ Install zed"
curl -f https://zed.dev/install.sh | sh

# Do it by hand instead.
# echo "▶ Install Sublime Text"
# sudo dnf config-manager addrepo --from-repofile=https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
# sudo dnf install sublime-text -y
#
# echo "▶ Install Sublime Merge"
# sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
# sudo dnf config-manager addrepo --from-repofile=https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
# sudo dnf install sublime-merge -y

echo "▶ Install bottom, the rice thing I don't use."
sudo dnf copr enable atim/bottom -y
sudo dnf install bottom -y

echo "▶ Install Rustic"
cargo binstall rustic-rs

# dtop, a docker thing.
curl --proto '=https' --tlsv1.2 -LsSf https://github.com/amir20/dtop/releases/latest/download/dtop-installer.sh | sh

# glow. I don't use it, but it's a cool thing to install. 😑
go install github.com/charmbracelet/glow/v2@latest

# Install rich, yazi needs this.
pipx install rich-cli

# End of additional packages.

# Docker installation.
# https://docs.docker.com/engine/install/fedora/#install-using-the-repository

echo "▶ Install docker"

# To be sure, uninstall all docker packages first, just in case.
sudo dnf remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

# Setup the official docker repo.
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

# This is the actual installation step.
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Docker post installation.
# sudo groupadd docker <- not needed. I'm just following the instructions.
sudo usermod -aG docker $USER

echo "You should log out and log back in for this docker to take effect!"
echo "But you would do it anyway after everything is done."

# ...
# newgrp docker. <- don't work either, I don't know why.

# I'd rather do it manually on demand.
# sudo systemctl enable --now docker

# End of docker installation.

# I use this.
echo "▶ Install cloudflared"
sudo dnf config-manager addrepo --from-repofile=https://pkg.cloudflare.com/cloudflared.repo
sudo dnf install cloudflared -y

# Nope
# sudo systemctl enable cloudflared
# sudo systemctl restart cloudflared

# # ============================================================
#  ⌨️ GNOME SETTINGS
# ============================================================

# I really can't remember where these numbers came from.
# There are many places I have saved these numbers, gist for example, and everywhere they are not the same lol.
# This one was from my current machine, so you (me) are stuck with it.

# For faster traversals.
echo "▶ Configure Keyboard Settings"
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30 || true
gsettings set org.gnome.desktop.peripherals.keyboard delay 300 || true

# Not sure why I added this in the first place.
# It could be because my keyboard is too sensitive.
# This may allow me to type faster by typing slower??
echo "▶ Configure bounce keys"
gsettings set org.gnome.desktop.a11y.keyboard bouncekeys-enable true || true
gsettings set org.gnome.desktop.a11y.keyboard bouncekeys-delay 56 || true

# Note that the `|| true` are for silencing errors, if it works, great.
# But if it fails, don't crash the script, keep going.

# ============================================================
#  🎉 FINISHED
# ============================================================

echo ""
echo "▶ Human they like green text, show them green text!. 🟢"
echo "Finished! 🟢"
echo ""
echo "💚, 🍏, 🥬, 🥒, 🍃, 🌿, 🌱, 🍀, 🍃, 🌴, 🌍, 🌻, 🌈, 🌳, 🌷, 🌿, 🍃, 🍏, 🍐, 🥦, 🥒"

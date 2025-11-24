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
    fd-find \
    ripgrep \
    bat \
    oxker \
    supdock \
    cargo-binstall

    # bottom \
    # gitui \
    # lsd \ Do it with dnf instead.

# Additional packages start here...

echo "▶ Install yazi"
sudo dnf copr enable lihaohong/yazi
sudo dnf install yazi -y

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

# End of additional packages.

# ============================================================
#  🎉 FINISHED
# ============================================================

echo ""
echo "▶ Human they like green text, show them green text!. 🟢"
echo "Finished! 🟢"
echo ""
echo "💚, 🍏, 🥬, 🥒, 🍃, 🌿, 🌱, 🍀, 🍃, 🌴, 🌍, 🌻, 🌈, 🌳, 🌷, 🌿, 🍃, 🍏, 🍐, 🥦, 🥒"

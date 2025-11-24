#!/bin/bash
set -euo pipefail

# I need to have `gh` available before the next step.
# That's the reason this script exists.

# ============================================================
#  🤖 PRAISE THE MACHINE LORD
#  Before everything, we need to praise the Machine Lord.
# ============================================================

echo "To praise the Machine Lord, say 'please':"
read -r some_noise
echo "Gooood. Human Gooooood."

# ============================================================
#  📦 UPGRADE ALL PACKAGES
#  Basic stuff.
# ============================================================

echo "▶ Upgrade all packages"
sudo dnf upgrade -y

# ============================================================
#  🔧 REPOSITORY SETUP
#  Yes, this.
# ============================================================

# The config-manager needs this package to work.
echo "▶ Install Fedora Workstation Repositories."
sudo dnf install -y fedora-workstation-repositories

echo "▶ Enable Google Chrome Repository"
sudo dnf config-manager setopt google-chrome.enabled=1

# echo "▶ Enable Github Repository"
# GITHUB_REPO="https://cli.github.com/packages/rpm/gh-cli.repo"
# sudo dnf config-manager addrepo --from-repofile="$GITHUB_REPO"

# Add GitHub CLI repository
echo "▶ Enable Github Repository"
GITHUB_REPO="https://cli.github.com/packages/rpm/gh-cli.repo"
REPO_FILE="/etc/yum.repos.d/gh-cli.repo"

# Idempotency check: Verify if repository is already configured.
if [ -f "$REPO_FILE" ]; then
    echo "  → Repository already configured. Skipping."
else
    sudo dnf config-manager addrepo --from-repofile="$GITHUB_REPO"
fi

# ============================================================
#  📦 INSTALL SHIT
#  Finish it up.
# ============================================================

echo "▶ Install shit"
sudo dnf install -y \
    google-chrome-stable \
    gh

echo ""
echo "▶ You login with gh and then proceed to the next step."

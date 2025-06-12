#!/bin/bash

function installApp {
    install="am -ia --user"

    $install "$@"

    sleep 2
}

echo "Installing Browsers"
installApp "floorp librewolf"

echo "Installing some commonly used apps"
installApp bitwarden freetube materialious deadbeef czkawka keepassxc stacer ente-auth


# Idea: on some slim installs (like my 16GB NVME Chromebook) these are "not needed"
## hence why these are commented out "by default"
# echo "Installing Extras"
# installApp responsively vscodium

# echo "Installing Unofficial apps"
# installApp brave strawberry

# echo "Installing total extras"
# installApp etcher figma-linux gimp ungoogled-chromium ocenaudio libreofficevcelestia firedragon warp-terminal mediaelch spotify-dl photogimp tabbyb tenacity  zen-browser ente-auth
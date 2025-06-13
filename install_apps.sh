#!/bin/bash

browsers="floorp librewolf"
common_apps="bitwarden freetube materialious deadbeef czkawka keepassxc stacer ente-auth"
extras="responsively vscodium"
unofficial_apps="brave strawberry"
total_extras="etcher figma-linux gimp ungoogled-chromium ocenaudio libreoffice vcelestia firedragon warp-terminal mediaelch spotify-dl photogimp tabbyb tenacity zen-browser ente-auth"

function installApp {
    install="am -ia --user"
    for app in "$@"; do
        echo "Installing $app..."
        if command -v "$app" &>/dev/null; then
            echo "$app is already installed."
            echo "If $app wasn't installed by am or appman, check your distro's package manager as that could be what is being detected"
            sleep 2
        else
            $install "$app"
            if [ $? -eq 0 ]; then
                echo "$app installed successfully."
            else
                echo "Failed to install $app."
                sleep 2
            fi
        fi
    done

    sleep 2
}

function installMenu() {
    clear
    x=1
    while [ $x -eq 1 ]; do
        echo "==========================="
        echo "AM - App Installer Menu"
        echo "==========================="
        echo "Select apps to install:"

        echo "1) Browsers: $browsers"
        echo "2) Commonly used apps: $common_apps"
        echo "3) Extras: $extras"
        echo "4) Unofficial apps: $unofficial_apps"
        echo "5) Total extras: $total_extras"
        echo -e "\nQ) Quit"
        echo -n "Please select an option (1-6): "
        read -r choice

        case $choice in
        1)
            echo "Installing Browsers: $browsers"
            installApp $browsers
            ;;

        2)
            echo "Installing Commonly used apps: $common_apps"
            installApp $common_apps
            ;;

        3)
            echo "Installing Extras: $extras"
            installApp $extras
            ;;

        4)
            echo "Installing Unofficial apps: $unofficial_apps"
            installApp $unofficial_apps
            ;;

        5)
            echo "Installing Total Extras: $total_extras"
            installApp $total_extras
            ;;
        [Qq])
            echo "Exiting menu."
            x=0
            ;;

        *)
            echo "Invalid option. Try again."
            sleep 2
            ;;
        esac
    done
}

# Call the menu function
installMenu

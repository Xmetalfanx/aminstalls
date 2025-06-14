#!/bin/bash

function assign_app_variables() {

    browsers="floorp librewolf"
    developer_apps="figma-linux gitkraken responsively vscodium"
    # this does not include "unofficial" marked browsers like brave (in am unofficial)
    extra_browsers="brave firedragon ungoogled-chromium zen-browser"
    # this also does not include "unofficial" marked apps like strawberry (in am unofficial)
    multimedia_apps="deadbeef gimp mediaelch ocenaudio photogimp tenacity xnviewmp"
    security_apps="bitwarden ente-auth keepassxc"
    system_apps="czkawka etcher stacer"
    terminal_apps="tabbyb warp-terminal"
    youtube_apps="freetube materialious"
    total_extras="celestia libreoffice nheko spotify-dl"
    unofficial_apps="strawberry"

}

# the idea here is to detect if "am" or "appman is present"
function am_version_detection() {

    if command -v am >/dev/null 2>&1; then
        install="am -ia --user"
    elif command -v appman >/dev/null 2>&1; then
        install="appman"
    # Check if both 'am' and 'appman' are installed
    elif command -v am >/dev/null 2>&1 && command -v appman >/dev/null 2>&1; then
        echo "Error: Both 'am' and 'appman' are installed. Please resolve this conflict." 
        exit 1
    else
        echo "Neither 'am' nor 'appman' is installed. Please install one of them to use this script."
        exit 1
    fi
 
}


function installApp {
   
    # Detect if am or appman is installed
    am_version_detection

    # Assign app variables
    assign_app_variables


    # Use the install command based on am_version_detection results
    
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
    bold="\033[1m"
    end_bold="\033[0m"
    
    # Source app variables
    assign_app_variables
    
    clear
    x=1
    while [ $x -eq 1 ]; do
        echo "==========================="
        echo "AM - App Installer Menu"
        echo "==========================="
        echo -e "\vSelect apps to install:\n "

        echo -e "1) ${bold}Browsers:${end_bold} $browsers"
        echo -e "2) ${bold}Extra Browsers:${end_bold} $extra_browsers"
        echo -e "3) ${bold}Developer apps:${end_bold} $developer_apps"
        echo -e "4) ${bold}Multimedia apps:${end_bold} $multimedia_apps"
        echo -e "5) ${bold}Security apps:${end_bold} $security_apps"
        echo -e "6) ${bold}System apps:${end_bold} $system_apps"
        echo -e "7) ${bold}Terminal apps:${end_bold} $terminal_apps"
        echo -e "8) ${bold}YouTube apps:${end_bold} $youtube_apps"
        echo -e "9) ${bold}Total extras:${end_bold} $total_extras"
        echo -e "10) ${bold}Unofficial apps:${end_bold} $unofficial_apps"
        echo -e "\nQ) Quit"
        echo -n "Please select an option (1-10): "
        read -r choice

        case $choice in
        1)
            echo "Installing Browsers: $browsers"
            installApp $browsers
            ;;

        2)
            echo "Installing Extra Browsers: $extra_browsers"
            installApp $extra_browsers
            ;;

        3)
            echo "Installing Developer apps: $developer_apps"
            installApp $developer_apps
            ;;

        4)
            echo "Installing Multimedia apps: $multimedia_apps"
            installApp $multimedia_apps
            ;;

        5)
            echo "Installing Security apps: $security_apps"
            installApp $security_apps
            ;;

        6)
            echo "Installing System apps: $system_apps"
            installApp $system_apps
            ;;

        7)
            echo "Installing Terminal apps: $terminal_apps"
            installApp $terminal_apps
            ;;

        8)
            echo "Installing YouTube apps: $youtube_apps"
            installApp $youtube_apps
            ;;

        9)
            echo "Installing Total extras: $total_extras"
            installApp $total_extras
            ;;

        10)
            echo "Installing Unofficial apps: $unofficial_apps"
            installApp $unofficial_apps
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
